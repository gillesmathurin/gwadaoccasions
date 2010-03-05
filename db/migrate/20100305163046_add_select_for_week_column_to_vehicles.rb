class AddSelectForWeekColumnToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :select_for_week, :boolean, :default => false
  end

  def self.down
    remove_column :vehicles, :select_for_week
  end
end
