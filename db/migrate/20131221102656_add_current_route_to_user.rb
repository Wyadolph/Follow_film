class AddCurrentRouteToUser < ActiveRecord::Migration
  def change
  	add_column :users, :current_route_id,:integer
  end
end
