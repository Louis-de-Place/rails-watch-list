class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :overview
      t.string :release_date
      t.string :poster_path
      t.float :vote_average
      t.integer :tmdb_id
      t.string :list_type

      t.timestamps
    end
    add_index :movies, :tmdb_id, unique: true
  end
end
