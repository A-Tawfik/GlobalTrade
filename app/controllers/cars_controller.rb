class CarsController < ApplicationController
  def import
  Car.import(params[:file])
  redirect_to root_url, notice: "Cars imported."
end
end
