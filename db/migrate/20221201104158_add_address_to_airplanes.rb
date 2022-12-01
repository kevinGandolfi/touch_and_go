class AddAddressToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_column :airplanes, :address, :string
  end
end
