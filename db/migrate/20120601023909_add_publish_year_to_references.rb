class AddPublishYearToReferences < ActiveRecord::Migration
  def change
    add_column :references, :publish_year, :int

  end
end
