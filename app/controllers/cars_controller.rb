class CarsController < ApplicationController
  def import
    Car.destroy_all
    Car.import(params)
    redirect_to cars_path, notice: "Cars imported."
  end

  def index
    @count = params["count"] ? params["count"].to_i : 25
    @starting = params["starting"] ? params["starting"].to_i : 1
    query_string = "location_city = 'NC'"
    Car.where(query_string).count

    @cars_page = Car.where(:id => @starting..(@starting + @count))
    @cars = Car.all
  end

end
