class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :title
      t.string :currency
      t.float :balance

      t.timestamps
    end
  end
end
