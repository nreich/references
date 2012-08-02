class AddIndexesToCategoriesCitations < ActiveRecord::Migration
  def change
    add_index :categories_citations, [:category_id, :citation_id], :unique => true
  end
end
