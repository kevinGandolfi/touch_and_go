class AddCoordinatesToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_column :airplanes, :latitude, :float
    add_column :airplanes, :longitude, :float
  end
end
