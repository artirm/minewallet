class RemoveUserIdFromStorages < ActiveRecord::Migration
  def change
    remove_column :storages, :user_id, :integer
  end
end
