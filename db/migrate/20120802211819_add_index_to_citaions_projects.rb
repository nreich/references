class AddIndexToCitaionsProjects < ActiveRecord::Migration
  def change
    add_index :citations_projects, [:citation_id, :project_id], :unique => true
  end
end
