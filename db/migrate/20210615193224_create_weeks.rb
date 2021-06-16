class CreateWeeks < ActiveRecord::Migration[6.1]
  def change
    create_table :weeks do |t|
      t.date :start_date

      t.timestamps
    end
  end
end
