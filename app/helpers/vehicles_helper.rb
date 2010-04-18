module VehiclesHelper
  
  def vehicle_info(vehicle)
    case vehicle.type
    when "Voiture"
      "#{vehicle.modele} - Année : #{vehicle.display_year} - #{vehicle.price} €"
    when "Moto"
      "#{vehicle.modele} - #{vehicle.cylindree} cm3 - Année : #{vehicle.display_year} - #{vehicle.price} €"
    when "Jetski"
      "#{vehicle.modele} - Année : #{vehicle.display_year} - #{vehicle.price} €"
    when "Bateau"
      "#{vehicle.modele} - #{vehicle.price} €"
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
      "VENDU"
    end
  end
  
  def taggable_for_the_week?(vehicle)
    unless vehicle.select_for_week
      link_to_remote "Mettre en sélection de la semaine", :url => select_for_week_provider_vehicle_path(current_provider, vehicle.id), :method => :put
    else
      "<br/>"+"Déjà en sélection de la semaine"
    end
  end
end


  