class CreateFilmsLocations < ActiveRecord::Migration
  def change
    create_table :films_locations do |t|
      t.integer :location_id
      t.integer :film_id

      t.timestamps
    end
  end
end
