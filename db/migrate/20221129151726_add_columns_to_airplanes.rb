class AddColumnsToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_column :airplanes, :range, :integer
    add_column :airplanes, :max_altitude, :integer
  end
end
