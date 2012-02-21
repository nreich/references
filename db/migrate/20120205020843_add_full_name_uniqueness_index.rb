class AddFullNameUniquenessIndex < ActiveRecord::Migration
  def up
  add_index :users, [:first_name, :last_name], :unique => true
  end

  def down
  remove_index :users, [:first_name, :last_name]
  end
end
