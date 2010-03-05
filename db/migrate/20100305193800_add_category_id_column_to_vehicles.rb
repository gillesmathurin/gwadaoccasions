class AddCategoryIdColumnToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :category_id, :integer
  end

  def self.down
    remove_column :vehicles, :category_id
  end
end
