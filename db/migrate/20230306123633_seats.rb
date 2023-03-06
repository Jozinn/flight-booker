class Seats < ActiveRecord::Migration[7.0]
  def change
    add_column :flights, :empty_seats, :int
  end
end
