class CreateLibrarySections < ActiveRecord::Migration[5.2]
  def change
    create_table :library_sections do |t|
      t.string :name
      t.timestamps
    end
  end
end
