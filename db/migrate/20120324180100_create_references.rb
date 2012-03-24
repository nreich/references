class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :title
      t.string :abstract
      t.string :pubmed_url
      t.string :file_location
      t.string :type
      t.date :year
      t.string :journal
      t.string :issue
      t.string :volume
      t.string :pages
      t.string :conference
      t.string :patent_assignee
      t.string :patent_number
      t.string :publisher

      t.timestamps
    end
  end
end
