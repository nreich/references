class RenameReferenceAuthorRelationship < ActiveRecord::Migration
  def up
    rename_table :reference_author_relationships, :citation_author_relationships
    rename_column :citation_author_relationships, :reference_id, :citation_id
  end

  def down
    rename_table :citation_author_relationships, :reference_author_relationships
    rename_column :reference_author_relationships, :citation_id, :reference_id
  end
end
