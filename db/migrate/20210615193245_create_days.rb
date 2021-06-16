class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.references :week, foreign_key: true
      t.references :meal

      t.timestamps
    end
  end
end
