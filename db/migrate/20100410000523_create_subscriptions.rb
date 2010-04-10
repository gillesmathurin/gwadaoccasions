class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.integer :plan_id
      t.datetime :subscription_date
      t.string :status
      t.integer :provider_id
      t.string :subscriber_id

      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
