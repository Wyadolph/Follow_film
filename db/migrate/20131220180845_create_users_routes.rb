class CreateUsersRoutes < ActiveRecord::Migration
  def change
    create_table :users_routes do |t|
      t.integer :user_id
      t.integer :route_id

      t.timestamps
    end
  end
end
