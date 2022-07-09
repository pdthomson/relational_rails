class CreateMangas < ActiveRecord::Migration[5.2]
  def change
    create_table :mangas do |t|
      t.string :name
      t.boolean :completed
      t.integer :number_of_chapters
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
