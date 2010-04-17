class AddNameAndMobileColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :mobile, :string
  end

  def self.down
    remove_column :users, :mobile
    remove_column :users, :name
  end
end
