class AddNameIndexToAuthors < ActiveRecord::Migration
  def change
    add_index :authors, :name, :unique => true
  end
end
