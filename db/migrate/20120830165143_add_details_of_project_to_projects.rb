class AddDetailsOfProjectToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :in_short, :text
    add_column :projects, :objective, :text
    add_column :projects, :who_should_apply, :text
    add_column :projects, :further_details, :text
    add_column :projects, :mission_type, :string
    add_column :projects, :status, :string
    add_column :projects, :cap, :integer
    add_column :projects, :applicant_count, :integer
  end
end
