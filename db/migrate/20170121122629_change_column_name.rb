class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :my_date_time, :publish_date
  end
end
