class AddRfrontpicColumnsToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :rfrontpic_file_name, :string
    add_column :vehicles, :rfrontpic_content_type, :string
    add_column :vehicles, :rfrontpic_file_size, :integer
    add_column :vehicles, :rfrontpic_updated_at, :datetime
  end

  def self.down
    remove_column :vehicles, :rfrontpic_updated_at
    remove_column :vehicles, :rfrontpic_file_size
    remove_column :vehicles, :rfrontpic_content_type
    remove_column :vehicles, :rfrontpic_file_name
  end
end
