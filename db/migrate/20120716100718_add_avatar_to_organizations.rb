class AddAvatarToOrganizations < ActiveRecord::Migration
  def change
    add_attachment :organizations, :avatar
  end
end
