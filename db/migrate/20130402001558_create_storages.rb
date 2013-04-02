class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.integer :account_id
      t.string :title
      t.float :amount
      t.string :description
      t.string :tags
      t.integer :kind
      t.integer :type

      t.timestamps
    end
  end
end
