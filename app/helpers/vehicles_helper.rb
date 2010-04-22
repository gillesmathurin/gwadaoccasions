module VehiclesHelper
  
  def vehicle_info(vehicle)
    case vehicle.type
    when "Voiture"
      @content = content_tag(:p, content_tag(:span, "#{vehicle.modele}", :class => "modele"))
      @content << content_tag(:p, "Année : #{vehicle.display_year}")
      @content << content_tag(:p, content_tag(:span, "#{vehicle.price} €", :class => "prix"))
      @content << content_tag(:p, content_tag(:span, "#{format_km(vehicle.kilometrage)}", :class => "km"))
      @content << content_tag(:p, "#{vehicle.energy} - Boite #{vehicle.boite_vitesse}")
      @content << content_tag(:p, "Immatriculation : #{vehicle.immatriculation}")
    when "Moto"
      @content = content_tag(:p, content_tag(:span, "#{vehicle.modele}", :class => "modele"))
      @content << content_tag(:p, "Cylindrée : #{vehicle.cylindree} cm3")
      @content << content_tag(:p, "Année : #{vehicle.display_year}")
      @content << content_tag(:p, content_tag(:span, "#{vehicle.price} €", :class => "prix"))
      @content << content_tag(:p, content_tag(:span, "#{format_km(vehicle.kilometrage)}", :class => "km"))
      @content << content_tag(:p, "#{vehicle.energy} - Boite #{vehicle.boite_vitesse}")
      @content << content_tag(:p, "Immatriculation : #{vehicle.immatriculation}")
    when "Jetski"
      @content = content_tag(:p, content_tag(:span, "#{vehicle.modele}", :class => "modele"))
      @content << content_tag(:p, "Année : #{vehicle.display_year}")
      @content << content_tag(:p, content_tag(:span, "#{vehicle.price} €", :class => "prix"))
    when "Bateau"
      @content = content_tag(:p, content_tag(:span, "#{vehicle.modele}", :class => "modele"))
      @content << content_tag(:p, content_tag(:span, "#{vehicle.price} €", :class => "prix"))
    end
  end
  
  def quick_info(vehicle)
    case vehicle.type
    when "Voiture"
      "#{format_km(vehicle.kilometrage)} - #{vehicle.energy} - Boite #{vehicle.boite_vitesse} - Immatriculé : #{vehicle.immatriculation}"
    when "Moto"
      "#{format_km(vehicle.kilometrage)} - Immatriculé : #{vehicle.immatriculation}"
    when "Jetski"
      ""
    when "Bateau"
      ""
    end
  end

  def vehicle_available?(vehicle)
    if vehicle.disponibilite
      link_to_remote "Marquer comme Vendu", :url => mark_as_sold_provider_vehicle_path(current_provider, vehicle.id),
       :method => :put
    else
      content_tag(:span, "VENDU", :class => "notification")
    end
  end
  
  def taggable_for_the_week?(vehicle)
    unless vehicle.select_for_week
      link_to_remote "Sélectionner pour la semaine", :url => select_for_week_provider_vehicle_path(current_provider, vehicle.id), :method => :put
    else
      "<br/>"+content_tag(:span, "Déjà en sélection de la semaine", :class => "notification") + " " + link_to_remote("Déselectionner", select_for_week_provider_vehicle_path(current_provider, vehicle.id), :method => :put, :class => "notification")
    end
  end
end


  