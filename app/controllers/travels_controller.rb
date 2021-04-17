class TravelsController < ApplicationController

  def create
    creator = TravelManager::Creator.new(travel_params)
    render json: creator.create
  end

  private

  def travel_params
    params.permit(:destination, :origin, :departure_date, :return_date)
  end
end

 #render json: creator.create, serializer: OrderSerializer::Model
