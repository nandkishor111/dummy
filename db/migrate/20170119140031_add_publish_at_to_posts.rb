class AddPublishAtToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :published_at, :datetime, :null => false, :default => Time.now
  end
end
