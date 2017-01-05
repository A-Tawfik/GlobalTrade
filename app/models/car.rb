require 'csv'

class Car < ApplicationRecord
  validates :lot_number, uniqueness: true



  def self.import(params)
    uri = URI("http://www.copart.com/public/lots/search")
    form_params = {
                draw: "1",
                start: "0",
                length: "20",
                sort: "auction_date_type desc,auction_date_utc asc",
                defaultSort: "true",
                query: params["query"],
                watchListOnly: "false",
                freeFormSearch: "false",
                page: "0",
                "filter[MISC]": "vehicle_type_code:VEHTYPE_V,lot_year:[2006 TO 2017]",
                size: "50"
            }

    response = JSON.parse((Net::HTTP.post_form(uri, form_params)).body)
    data = response["data"]["results"]["content"]



    # binding.pry
    data.each do |row|
      new_car = Car.new(
                :yard_number =>  row["ynumb"].to_i,
                :yard_name => row["yn"],
                :sale_datetime => parse_datetime(row["ad"],
                                                 row["at"]),
                :time_zone => timezone(row["tz"]),
                # :item_number => row["Item#"].to_i,
                :lot_number => row["ln"].to_i,
                # :vehicle_type => row["Vehicle Type"],
                :year => row["lcy"].to_i,
                :make => row["mkn"],
                # :model_group => row["Model Group"],
                :model_detail => row["lm"],
                :body_style => row["bstl"],
                # :color => row["Color"],
                :damage_description => row["dd"],
                :secondary_damage => row["sdd"],
                :sale_title_state => row["ts"],
                :sale_title_type => row["stt"],
                :has_keys => has_keys?(row["hk"]),
                :lot_cond_code => row["lcc"],
                :vin => row["fv"],
                :odometer => row["orr"].to_i,
                :odometer_brand => row["ord"],
                # :est_retail_value => row["Est. Retail Value"].to_i,
                # :repair_cost => row["Repair cost"].to_i,
                :engine => row["egn"],
                :drive => row["drv"],
                # :transmission => row["Transmission"],
                :fuel_type => row["ft"],
                :cylinders => row["cy"].to_i,
                # :runs_drives => row["Runs/Drives"],
                # :sale_status => row["Sale Status"],
                # :high_bid => row["High Bid =non-vix, Sealed=Vix"],
                # :special_note => row["Special Note"],
                # :location_city => row["Location city"],
                # :location_state => row["Location state"],
                # :location_zip => row["Location ZIP"],
                # :location_country => row["Location country"],
                # :currency_code => row["Currency Code"],
                :image_thumbnail => row["tims"],
                # :grid_row => row["Grid/Row"],
                # :has_buyitnow => row["Make-an-Offer Eligible"],
                # :buyitnow_price => row["Buy-It-Now Price"],
                :lot_url => "https://www.copart.com/lot/#{"lotNumberStr"}" ,
                :state_of_ownership_doc_type => "" ,
                :ownership_doc_type => ""
                )
                new_car.save
    end
  end
  def update

  end

  def self.parse_datetime(date, time)
    this_date = Date.strptime(date.to_s[0..-4], '%s').to_s
    # binding.pry
    return DateTime.parse(this_date + " #{time}" ) if date != '0'
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
