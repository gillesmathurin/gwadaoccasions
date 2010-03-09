module SearchesHelper
  def format_km(kilometrage)
    number_to_currency(kilometrage, :unit =>"km", :delimiter =>"", :format =>"%n %u")
  end
end
