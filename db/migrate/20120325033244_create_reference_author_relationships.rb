class CreateReferenceAuthorRelationships < ActiveRecord::Migration
  def change
    create_table :reference_author_relationships do |t|
      t.integer :reference_id
      t.integer :author_id
      t.integer :author_order

      t.timestamps
    end
    add_index :reference_author_relationships, :reference_id
    add_index :reference_author_relationships, :author_id
  end
end
