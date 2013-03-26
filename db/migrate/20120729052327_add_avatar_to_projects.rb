class AddAvatarToProjects < ActiveRecord::Migration
  def change
    add_attachment :projects, :avatar
  end
end
