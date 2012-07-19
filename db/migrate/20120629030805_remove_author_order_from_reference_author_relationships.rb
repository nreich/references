class RemoveAuthorOrderFromReferenceAuthorRelationships < ActiveRecord::Migration
  def up
    remove_column :reference_author_relationships, :author_order
  end

  def down
    add_column :reference_author_relationships, :author_order
  end
end
