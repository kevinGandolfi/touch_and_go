class CreateAirplanes < ActiveRecord::Migration[7.0]
  def change
    create_table :airplanes do |t|
      t.integer :weight
      t.string :registration
      t.integer :number_of_engines
      t.string :brand_and_model
      t.integer :pax_capacity

      t.timestamps
    end
  end
end
