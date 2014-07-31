class DeviseCreateProviders < ActiveRecord::Migration
  def self.up
    create_table(:providers) do |t|
      t.string :login, :company, :address, :zipcode, :city, :state, :telephone, :fax, :mobile, :contact_name

      t.timestamps
    end
  end

  def self.down
    drop_table :providers
  end
end
