class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :name
      t.string :attachment
      t.integer :imageable_id
      t.string  :imageable_type
      t.timestamps
    end
  end
end
