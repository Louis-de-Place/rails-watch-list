class CreateTvSeries < ActiveRecord::Migration[7.1]
  def change
    create_table :tv_series do |t|
      t.string :name
      t.text :overview
      t.string :first_air_date
      t.string :poster_path
      t.float :vote_average
      t.integer :tmdb_id
      t.string :list_type

      t.timestamps
    end
    add_index :tv_series, :tmdb_id, unique: true
  end
end
