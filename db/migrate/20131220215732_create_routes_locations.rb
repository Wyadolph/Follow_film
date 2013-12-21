class CreateRoutesLocations < ActiveRecord::Migration
  def change
    create_table :routes_locations do |t|
      t.integer :route_id
      t.integer :location_id

      t.timestamps
    end
  end
end
