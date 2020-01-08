class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :email, null: false, default: '', limit: 191
      t.string :encrypted_password, null: false, default: ''

      t.string :token, limit: 191

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
