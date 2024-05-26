class AddDetailsToActors < ActiveRecord::Migration[7.1]
  def change
    add_column :actors, :tmdb_id, :integer
    add_column :actors, :biography, :text
    add_column :actors, :birthday, :string
    add_column :actors, :popularity, :float
    rename_column :actors, :profile_url, :profile_path
    add_index :actors, :tmdb_id, unique: true
  end
end
