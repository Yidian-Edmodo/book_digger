class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :user_id
      t.string :keywords
      t.string :cover_image_url
      t.text :description

      t.timestamps
    end
  end
end
