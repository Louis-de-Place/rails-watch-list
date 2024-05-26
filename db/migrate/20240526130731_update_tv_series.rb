class UpdateTvSeries < ActiveRecord::Migration[7.1]
  def change
    rename_column :tv_series, :poster_url, :poster_path
    rename_column :tv_series, :rating, :vote_average
    add_column :tv_series, :first_air_date, :string
    add_column :tv_series, :tmdb_id, :integer
    add_column :tv_series, :list_type, :string
    add_index :tv_series, :tmdb_id, unique: true
  end
end
