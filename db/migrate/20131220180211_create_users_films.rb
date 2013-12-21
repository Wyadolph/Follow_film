class CreateUsersFilms < ActiveRecord::Migration
  def change
    create_table :users_films do |t|
      t.integer :user_id
      t.integer :film_id

      t.timestamps
    end
  end
end
