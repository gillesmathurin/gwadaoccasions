class CreateSearchProfiles < ActiveRecord::Migration
  def self.up
    create_table :search_profiles do |t|
      t.string :category
      t.integer :minprice
      t.integer :maxprice
      t.integer :minkilometer
      t.integer :maxkilometer
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :search_profiles
  end
end
