class AddUserRefToAirplanes < ActiveRecord::Migration[7.0]
  def change
    add_reference :airplanes, :user, null: false, foreign_key: true
  end
end
