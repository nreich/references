class CreateCitationsProjectsJoin < ActiveRecord::Migration
  def up
    create_table 'citations_projects', :id => false do |t|
      t.column 'citation_id', :integer
      t.column 'project_id', :integer
    end
    
  end

  def down
    drop_table 'citations_projects'
  end
end
