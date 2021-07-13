class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.text :step
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
