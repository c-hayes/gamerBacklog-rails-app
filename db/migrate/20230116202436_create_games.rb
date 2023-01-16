class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :artworks
      t.string :name
      t.integer :platforms
      t.integer :release_dates
      t.integer :screenshots
      t.text :summary
      t.integer :genre
      t.float :total_rating

      t.timestamps
    end
  end
end
