# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def format_km(kilometrage)
    number_to_currency(kilometrage, :unit =>"km", :delimiter =>"", :format =>"%n %u")
  end
end
