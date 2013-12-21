class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
