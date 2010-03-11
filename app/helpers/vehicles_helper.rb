module VehiclesHelper
  def vehicle_title(vehicle)
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
end


  