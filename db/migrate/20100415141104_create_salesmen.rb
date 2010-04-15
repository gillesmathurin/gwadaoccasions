class CreateSalesmen < ActiveRecord::Migration
  def self.up
    create_table :salesmen do |t|
      t.string :name
      t.string :mobile_phone
      t.integer :provider_id

      t.timestamps
    end
  end

  def self.down
    drop_table :salesmen
  end
end
