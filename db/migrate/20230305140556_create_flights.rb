class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.datetime :start
      t.time :duration
      t.bigint :departure_id, foreign_key: true
      t.bigint :arrival_id, foreign_key: true
      t.timestamps
    end
  end
end
