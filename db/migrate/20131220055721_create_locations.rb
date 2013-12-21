class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.float :log
      t.float :lat
      t.integer :film_id
      t.integer :route_id

      t.timestamps
    end
  end
end
