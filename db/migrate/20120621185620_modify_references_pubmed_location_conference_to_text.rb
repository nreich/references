class ModifyReferencesPubmedLocationConferenceToText < ActiveRecord::Migration
  def change
    change_column :references, :pubmed_url, :text
    change_column :references, :file_location, :text
    change_column :references, :conference, :text
  end
end
