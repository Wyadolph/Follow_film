class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.string :content
      t.integer :film_id

      t.timestamps
    end
  end
end
