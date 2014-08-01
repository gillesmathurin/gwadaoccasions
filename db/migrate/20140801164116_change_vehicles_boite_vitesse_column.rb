class ChangeVehiclesBoiteVitesseColumn < ActiveRecord::Migration
  def change
    change_column :vehicles, :boite_vitesse, :integer
  end
end
