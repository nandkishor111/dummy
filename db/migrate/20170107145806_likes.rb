class Likes < ActiveRecord::Migration[5.0]
  def change
  	 create_table :likes do |t|
    
     t.boolean :like, :default => false 
      t.integer :user_id 
      t.integer :likeable_id
      t.string :likeable_type
      t.timestamps
    end
  end
end
 