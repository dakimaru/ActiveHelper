class AddIndexToOrganizationsEmail < ActiveRecord::Migration
  def change
    add_index :organizations, :email, unique: true
  end
end
