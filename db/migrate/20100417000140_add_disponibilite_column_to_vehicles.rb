class AddDisponibiliteColumnToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :disponibilite, :boolean, :default => true
  end

  def self.down
    remove_column :vehicles, :disponibilite
  end
end
