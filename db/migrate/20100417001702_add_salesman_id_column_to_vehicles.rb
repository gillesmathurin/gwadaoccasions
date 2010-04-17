class AddSalesmanIdColumnToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :salesman_id, :integer
  end

  def self.down
    remove_column :vehicles, :salesman_id
  end
end
