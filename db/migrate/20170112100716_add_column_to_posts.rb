class AddColumnToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :panding, :boolean, :default => false 
  end
end
