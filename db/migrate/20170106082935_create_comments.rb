class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :post, foreign_key: true
      t.boolean :approve, :default => false
      t.integer :user_id
      t.timestamps
    end
  end
end
