class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false, limit: 100
      t.string :isbn, null: false, limit: 50
      t.integer :number_of_pages, default: 0

      t.timestamps
      t.index :isbn, unique: true
    end
  end
end
