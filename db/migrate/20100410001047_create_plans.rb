class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :nom
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
