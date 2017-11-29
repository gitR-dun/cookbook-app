class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :ingredients
      t.integer :prep_time
      t.string :directions
      t.string :title
      t.string :chef
      t.string :image

      t.timestamps
    end
  end
end
