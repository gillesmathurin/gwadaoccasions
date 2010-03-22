module SearchProfilesHelper
  
  # format the kilometers search_profile criterias for display
  def kilometers_criteria(profile)
    s = ""
    min_km = number_to_currency(profile.minkilometer, :precision => 0, :unit => "km", :delimiter => " ", :format => "%n %u") unless profile.minkilometer.nil?      
    max_km = number_to_currency(profile.maxkilometer, :precision => 0, :unit => "km", :delimiter => " ", :format => "%n %u") unless profile.maxkilometer.nil?
    
    if min_km && max_km
      s << "kilometrage compris entre : " + min_km + " et " + max_km
    elsif max_km && min_km.nil?
      s << "kilometrage inférieur à : " + max_km
    end 
    return s
  end
end
