class Airportname < ActiveRecord::Migration[7.0]
  def change
    add_column :airports, :name, :string
  end
end
