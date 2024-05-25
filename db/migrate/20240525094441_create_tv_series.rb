class CreateTvSeries < ActiveRecord::Migration[7.1]
  def change
    create_table :tv_series do |t|
      t.string :name
      t.text :overview
      t.string :poster_url
      t.integer :rating

      t.timestamps
    end
  end
end
