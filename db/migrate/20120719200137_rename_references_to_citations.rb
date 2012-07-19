class RenameReferencesToCitations < ActiveRecord::Migration
  def up
    rename_table :references, :citations
  end

  def down
    rename_table :citations, :references
  end
end
