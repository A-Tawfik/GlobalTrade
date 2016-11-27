class CarsController < ApplicationController
  def import
    Car.import(params[:file])
    redirect_to cars_path, notice: "Cars imported."
  end

  def index
    @cars = Car.all
  end



end
