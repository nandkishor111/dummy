class AddMyDateTimeToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :my_date_time, :datetime, :null => false, :default => Time.now
  end
end
