class ChangeSubscriptionStatusType < ActiveRecord::Migration
  def change
    change_column :subscriptions, :status, :integer
  end
end
