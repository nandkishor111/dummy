class Approverole < ActiveRecord::Migration[5.0]
  def change
  	create_table :approveroles do |t|
    
      t.boolean :approve_role, :default => false 
      t.integer :user_id 
      t.integer :role_id
    
     t.timestamps
    end
  end
end
