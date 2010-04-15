class AddProviderIdColumnToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :provider_id, :integer
  end

  def self.down
    remove_column :vehicles, :provider_id
  end
end
