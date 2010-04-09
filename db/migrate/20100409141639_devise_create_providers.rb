class DeviseCreateProviders < ActiveRecord::Migration
  def self.up
    create_table(:providers) do |t|
      t.database_authenticatable :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable
      t.string :login, :company, :address, :zipcode, :city, :state, :telephone, :fax, :mobile, :contact_name

      t.timestamps
    end

    add_index :providers, :email,                :unique => true
    add_index :providers, :confirmation_token,   :unique => true
    add_index :providers, :reset_password_token, :unique => true
    # add_index :providers, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :providers
  end
end
