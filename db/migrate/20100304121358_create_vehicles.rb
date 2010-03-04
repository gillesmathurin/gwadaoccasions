class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.string :type
      t.integer :price
      t.integer :kilometrage
      t.date :annee
      t.string :immatriculation
      t.string :serialnumber
      t.string :modele
      t.integer :marque_id
      t.string :cylindree
      t.string :energy
      t.string :boite_vitesse
      t.text :description
      t.string :overviewpic_file_name
      t.integer :overviewpic_file_size
      t.string :overviewpic_content_type
      t.datetime :overviewpic_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
