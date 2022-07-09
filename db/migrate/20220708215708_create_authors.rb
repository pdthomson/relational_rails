class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :year_published
      t.boolean :award_winner

      t.timestamps
    end
  end
end
