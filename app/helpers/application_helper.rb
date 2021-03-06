module ApplicationHelper
  def format_km(kilometrage)
    number_to_currency(kilometrage, :unit =>"km", :delimiter =>"", :format =>"%n %u")
  end
  
  def format_price(price)
    number_to_currency(price, :unit => "€", :delimeter=>" ", :format => "%n %u")
  end
  
  def french_phone(phone)
    phone.sub(/(\d{4})(\d{3})(\d{3})/, "\\1-\\2-\\3")
  end
end
