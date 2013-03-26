class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token_org
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :url
      t.text :mission
      t.text :description
      t.string :facebook_link
      t.string :twitter_link
      t.string :active_field_1
      t.string :active_field_2
      t.string :active_field_3
      
      t.timestamps
    end
  end
end
