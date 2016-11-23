class AddColumsToCars < ActiveRecord::Migration[5.0]
  def change
    change_table :cars do |t|
      t.integer :yard_number
      t.string :yard_name
      t.date :sale_date
      t.string :day_of_week
      t.time :sale_time
      t.string :time_zone
      t.integer :item_number
      t.integer :lot_number, unique: true, null: false
      t.string :vehicle_type
      t.integer :year
      t.string :make
      t.string :model_group
      t.string :model_detail
      t.string :body_style
      t.string :color
      t.string :damage_description
      t.string :secondary_damage
      t.string :sale_title_state
      t.string :sale_title_type
      t.boolean :has_keys
      t.string :lot_cond_code
      t.string :vin
      t.integer :odometer
      t.string :odometer_brand
      t.integer :est_retail_value
      t.integer :repair_cost
      t.string :engine
      t.string :drive
      t.string :transmission
      t.string :fuel_type
      t.integer :cylinders
      t.string :runs_drives
      t.string :sale_status
      t.integer :high_bid
      t.string :special_note
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.string :location_country
      t.string :currency_code
      t.string :image_thumbnail
      t.string :grid_row
      t.boolean :has_buyitnow
      t.integer :buyitnow_price
      t.string :lot_url
      t.string :state_of_ownership_doc_type
      t.string :ownership_doc_type
    end
  end
end
