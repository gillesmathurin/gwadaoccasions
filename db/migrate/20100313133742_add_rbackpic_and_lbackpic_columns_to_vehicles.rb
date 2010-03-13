class AddRbackpicAndLbackpicColumnsToVehicles < ActiveRecord::Migration
  def self.up
    add_column :vehicles, :rbackpic_file_name, :string
    add_column :vehicles, :rbackpic_content_type, :string
    add_column :vehicles, :rbackpic_file_size, :integer
    add_column :vehicles, :rbackpic_updated_at, :datetime
    add_column :vehicles, :lbackpic_file_name, :string
    add_column :vehicles, :lbackpic_content_type, :string
    add_column :vehicles, :lbackpic_file_size, :integer
    add_column :vehicles, :lbackpic_updated_at, :datetime
  end

  def self.down
    remove_column :vehicles, :lbackpic_updated_at
    remove_column :vehicles, :lbackpic_file_size
    remove_column :vehicles, :lbackpic_content_type
    remove_column :vehicles, :lbackpic_file_name
    remove_column :vehicles, :rbackpic_updated_at
    remove_column :vehicles, :rbackpic_file_size
    remove_column :vehicles, :rbackpic_content_type
    remove_column :vehicles, :rbackpic_file_name
  end
end
