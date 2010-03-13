class FixColumnNamesInVehicles < ActiveRecord::Migration
  def self.up
    rename_column :vehicles, :backpick_file_name, :backpic_file_name
    rename_column :vehicles, :backpick_updated_at, :backpic_updated_at
  end

  def self.down
    rename_column :vehicles, :backpic_updated_at, :backpick_updated_at
    rename_column :vehicles, :backpic_file_name, :backpick_file_name
  end
end
