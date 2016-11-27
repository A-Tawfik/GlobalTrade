require 'csv'
class Car < ApplicationRecord
  validates :lot_number, uniqueness: true



  def self.import(file)
    # binding.pry
    size = file.tempfile.readlines.size
    ::CSV.foreach(file.tempfile, headers: true) do |row|
      new_car = Car.new(
                :yard_number =>  row["Yard number"].to_i,
                :yard_name => row["Yard name"],
                :sale_datetime => parse_datetime(row["Sale Date M/D/CY"],
                                                 row["Sale time (HHMM)"]),
                :time_zone => timezone(row["Time Zone"]),
                :item_number => row["Item#"].to_i,
                :lot_number => row["Lot number"].to_i,
                :vehicle_type => row["Vehicle Type"],
                :year => row["Year"].to_i,
                :make => row["Make"],
                :model_group => row["Model Group"],
                :model_detail => row["Model Detail"],
                :body_style => row["Body Style"],
                :color => row["Color"],
                :damage_description => row["Damage Description"],
                :secondary_damage => row["Secondary Damage"],
                :sale_title_state => row["Sale Title State"],
                :sale_title_type => row["Sale Title Type"],
                :has_keys => has_keys?(row["Has Keys-Yes or No"]),
                :lot_cond_code => row["Lot Cond. Code"],
                :vin => row["VIN"],
                :odometer => row["Odometer"].to_i,
                :odometer_brand => row["Odometer Brand"],
                :est_retail_value => row["Est. Retail Value"].to_i,
                :repair_cost => row["Repair cost"].to_i,
                :engine => row["Engine"],
                :drive => row["Drive"],
                :transmission => row["Transmission"],
                :fuel_type => row["Fuel Type"],
                :cylinders => row["Cylinders"].to_i,
                :runs_drives => row["Runs/Drives"],
                :sale_status => row["Sale Status"],
                :high_bid => row["High Bid =non-vix, Sealed=Vix"],
                :special_note => row["Special Note"],
                :location_city => row["Location city"],
                :location_state => row["Location state"],
                :location_zip => row["Location ZIP"],
                :location_country => row["Location country"],
                :currency_code => row["Currency Code"],
                :image_thumbnail => row["Image Thumbnail"],
                :grid_row => row["Grid/Row"],
                :has_buyitnow => row["Make-an-Offer Eligible"],
                :buyitnow_price => row["Buy-It-Now Price"],
                :lot_url => "" ,
                :state_of_ownership_doc_type => "" ,
                :ownership_doc_type => ""
                )
                new_car.save
    end
  end
  def update
    
  end

  def self.parse_datetime(date, time)
    return DateTime.parse(date + time.rjust(4, '0')) if date != '0'
    nil
  end

  def self.timezone(timezone)
    case timezone
      when "EST"
        tz =  "Eastern Time (US & Canada)"
      when "CST"
        tz =  "Central Time (US & Canada)"
      when "MST"
        tz =  "Mountain Time (US & Canada)"
      when "PST"
        tz =  "Pacific Time (US & Canada)"
      when "AST"
        tz = "Alaska"
      when "HST"
        tz = "Hawaii"
      else
        tz =  "UTC"
    end
  end

  def self.has_keys?(arg)
    # return true or false
    arg.downcase!
    return true if arg == "yes" || arg == "y"
    false
  end

end
