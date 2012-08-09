class ModifyCitationAuthorRelationships < ActiveRecord::Migration
  def up
    add_column :citation_author_relationships, :author_order, :integer
    add_index :citation_author_relationships, [:citation_id, :author_id, :author_order], 
                                              :name => :unique_relationship, :unique => true
  end

  def down
    remove_index :citation_author_relationships, :name => :unique_relationship
    remove_column :citation_author_relationships, :author_order
  end
end
