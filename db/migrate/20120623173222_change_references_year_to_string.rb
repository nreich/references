class ChangeReferencesYearToString < ActiveRecord::Migration
  def change
    change_column :references, :publish_year, :string
  end
end
