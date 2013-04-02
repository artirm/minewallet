class ChangeStoragesType < ActiveRecord::Migration
  def up
    change_table :storages do |t|
      t.change :type, :string
    end
  end

  def down
    change_table :storages do |t|
      t.change :type, :integer
    end
  end
end
