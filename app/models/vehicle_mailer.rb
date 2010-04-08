class VehicleMailer < ActionMailer::Base
  

  def to_friend(sender, recipient, vehicle)
    subject    "#{sender} pense que cette occasion peut vous intéresser !"
    recipients recipient
    from       sender
    sent_on    Time.now
    
    body       :vehicle => vehicle, :friend_email => recipient
  end

end
