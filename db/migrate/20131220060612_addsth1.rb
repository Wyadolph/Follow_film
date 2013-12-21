class Addsth1 < ActiveRecord::Migration
  def change
  	add_column :users, :film_id, :integer
  	add_column :users, :route_id, :integer
  	add_column :sections, :location_id, :integer
  	#create_join_table :users, :routes
  	#create_join_table :users, :films
  	#create_join_table :locations, :films
  end
end
