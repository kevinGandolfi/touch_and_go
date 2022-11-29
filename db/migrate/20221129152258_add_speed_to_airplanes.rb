class AddSpeedToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_column :airplanes, :speed, :string
  end
end
