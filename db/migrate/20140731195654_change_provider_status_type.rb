class ChangeProviderStatusType < ActiveRecord::Migration
  def change
    change_column :providers, :status, :integer, limit: 1
  end
end
