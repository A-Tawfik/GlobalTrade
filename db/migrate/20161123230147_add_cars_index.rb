class AddCarsIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :cars, :lot_number, unique:true
  end
end
