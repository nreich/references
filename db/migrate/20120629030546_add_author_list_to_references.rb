class AddAuthorListToReferences < ActiveRecord::Migration
  def change
    add_column :references, :author_list, :text

  end
end
