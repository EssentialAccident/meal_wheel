class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.date :date
      t.references :week, foreign_key: true
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
