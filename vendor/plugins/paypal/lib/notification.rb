require 'net/http'

module Paypal
  # Parser and handler for incoming Instant payment notifications from paypal. 
  # The Example shows a typical handler in a rails application. Note that this
  # is an example, please read the Paypal API documentation for all the details
  # on creating a safe payment controller.
  #
  # Example
  #  
  #   class BackendController < ApplicationController
  #   
  #     def paypal_ipn
  #       notify = Paypal::Notification.new(request.raw_post)
  #   
  #       order = Order.find(notify.item_id)
  #     
  #       if notify.acknowledge 
  #         begin
  #           
  #           if notify.complete? and order.total == notify.amount
  #             order.status = 'success' 
  #             
  #             shop.ship(order)
  #           else
  #             logger.error("Failed to verify Paypal's notification, please investigate")
  #           end
  #   
  #         rescue => e
  #           order.status        = 'failed'      
  #           raise
  #         ensure
  #           order.save
  #         end
  #       end
  #   
  #       render :nothing
  #     end
  #   end
  class Notification
    attr_accessor :params
    attr_accessor :raw

    # Overwrite this url. It points to the Paypal sandbox by default.
    # Please note that the Paypal technical overview (doc directory)
    # speaks of a https:// address for production use. In my tests 
    # this https address does not in fact work. 
    # 
    # Example: 
    #   Paypal::Notification.ipn_url = http://www.paypal.com/cgi-bin/webscr
    #
    cattr_accessor :ipn_url
    @@ipn_url = 'https://www.sandbox.paypal.com/cgi-bin/webscr'

    # Creates a new paypal object. Pass the raw html you got from paypal in. 
    # In a rails application this looks something like this
    # 
    #   def paypal_ipn
    #     paypal = Paypal::Notification.new(request.raw_post)
    #     ...
    #   end
    def initialize(post)
      empty!
      parse(post)
    end

    # Was the transaction complete?
    def complete?
      status == "Completed"
    end

    def failed?
      status == "Failed"
    end
    
    def denied?
      status == "Denied"
    end

    # When was this payment received by the client. 
    # sometimes it can happen that we get the notification much later. 
    # One possible scenario is that our web application was down. In this case paypal tries several 
    # times an hour to inform us about the notification
    def received_at
      Time.parse params['payment_date']
    end

    # Whats the status of this transaction?
    def status
      params['payment_status']
    end

    # Id of this transaction (paypal number)
    def transaction_id
      params['txn_id']
    end

    # What type of transaction are we dealing with? 
    #  "cart" "send_money" "web_accept" are possible here. 
    def type
      params['txn_type']
    end

    # the money amount we received in X.2 decimal.
    def gross
      params['mc_gross']
    end

    # the markup paypal charges for the transaction
    def fee
      params['mc_fee']
    end

    # What currency have we been dealing with
    def currency
      params['mc_currency']
    end
  
    # This is the item number which we submitted to paypal 
    def item_id
      params['item_number']
    end

    # This is the invoice which you passed to paypal 
    def invoice
      params['invoice']
    end   
    
    # This is the invoice which you passed to paypal 
    def test?
      params['test_ipn'] == '1'
    end

    # This is the custom field which you passed to paypal 
    def custom
      params['custom']
    end
    
    # Reason for pending status, nil if status is not pending. 
    def pending_reason
      params['pending_reason']
    end
    
    # Reason for reversed status, nil if status is not reversed. 
    def reason_code
      params['reason_code']
    end
    
    # Memo entered by customer if any
    def memo
      params['memo']
    end
      
    # Well, the payment type.
    def payment_type
      params['payment_type']
    end
    
    # The exchange rate used if there was a conversion.
    def exchange_rate
      params['exchange_rate']
    end
    
    def receiver_email
      params['receiver_email']
    end
    
    def gross_cents
      (gross.to_f * 100.0).round
    end
    
    # reset the notification. 
    def empty!
      @params  = Hash.new
      @raw     = ""      
    end

    # Acknowledge the transaction to paypal. This method has to be called after a new 
    # ipn arrives. Paypal will verify that all the information we received are correct and will return a 
    # ok or a fail. 
    # 
    # Example:
    # 
    #   def paypal_ipn
    #     notify = PaypalNotification.new(request.raw_post)
    #
    #     if notify.acknowledge 
    #       ... process order ... if notify.complete?
    #     else
    #       ... log possible hacking attempt ...
    #     end
    def acknowledge(options={})
      user_agent = options[:user_agent] || "paypal-ruby -- http://rubyforge.org/projects/paypal/"

      payload =  raw
      
      uri = URI.parse(self.class.ipn_url)
      request_path = "#{uri.path}?cmd=_notify-validate"
      
      request = Net::HTTP::Post.new(request_path)
      request['Content-Length'] = "#{payload.size}"
      request['User-Agent']     = user_agent
 
      http = Net::HTTP.new(uri.host, uri.port)
 
      http.verify_mode    = OpenSSL::SSL::VERIFY_NONE unless @ssl_strict
      http.use_ssl        = true
 
      request = http.request(request, payload)
        
      raise StandardError.new("Faulty paypal result: #{request.body}") unless ["VERIFIED", "INVALID"].include?(request.body)
      
      request.body == "VERIFIED"
    end

    private
    
    # Take the posted data and move the relevant data into a hash
    def parse(post)
      @raw = post
      for line in post.split('&')    
        key, value = *line.scan( %r{^(\w+)\=(.*)$} ).flatten
        params[key] = CGI.unescape(value)
      end
    end

  end
end
