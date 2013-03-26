class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :organization_id
      
      t.timestamps
    end
    
    add_index :memberships, :user_id
    add_index :memberships, :organization_id
    add_index :memberships, [:user_id, :organization_id], unique: true
  end
end
