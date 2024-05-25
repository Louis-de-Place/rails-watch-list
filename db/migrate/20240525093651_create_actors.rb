class CreateActors < ActiveRecord::Migration[7.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :profile_url

      t.timestamps
    end
  end
end
