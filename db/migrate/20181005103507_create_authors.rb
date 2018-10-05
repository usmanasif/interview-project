class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name, null: false, limit: 100
      t.string :email, null: false, limit: 254
      t.string :gender, limit: 15
      t.string :address, limit: 100

      t.timestamps
      t.index :email, unique: true
    end
  end
end
