class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.string :cost
      t.datetime :start
      t.datetime :end
      t.integer :duration
      
      t.timestamps
    end
  end
end
