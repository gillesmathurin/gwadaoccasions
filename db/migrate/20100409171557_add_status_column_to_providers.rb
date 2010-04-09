class AddStatusColumnToProviders < ActiveRecord::Migration
  def self.up
    add_column :providers, :status, :string, :default => "pending"
  end

  def self.down
    remove_column :providers, :status
  end
end
