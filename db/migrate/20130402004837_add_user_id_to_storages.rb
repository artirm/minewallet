class AddUserIdToStorages < ActiveRecord::Migration
  def change
    add_column(:storages, :user_id, :integer)
  end
end
