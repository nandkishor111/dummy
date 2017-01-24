class AddTotalviewToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :countviews, :integer,:default => 0 
  end
end
