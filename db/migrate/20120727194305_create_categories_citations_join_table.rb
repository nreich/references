class CreateCategoriesCitationsJoinTable < ActiveRecord::Migration
  def up
    create_table 'categories_citations', :id => false do |t|
      t.column 'category_id', :integer
      t.column 'citation_id', :integer
    end
    
  end

  def down
    drop_table 'categories_citations'
  end
end
