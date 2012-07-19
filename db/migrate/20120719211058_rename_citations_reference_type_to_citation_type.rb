class RenameCitationsReferenceTypeToCitationType < ActiveRecord::Migration
  def up
    rename_column :citations, :reference_type, :citation_type
  end

  def down
    rename_column :citations, citation_type, :reference_type
  end
end
