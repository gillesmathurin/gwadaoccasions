class ChangeVehiclesEnergyColumn < ActiveRecord::Migration
  def change
    change_column :vehicles, :energy, :integer
  end
end
