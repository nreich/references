class AddNameAndProjectUniqueToCategories < ActiveRecord::Migration
  def change
    add_index :categories, [:name, :project_id], :unique => true
  end
end
