class ModifyReferencesTitleAndAbstractToText < ActiveRecord::Migration
  def change
    change_column :references, :title, :text
    change_column :references, :abstract, :text
  end
end
