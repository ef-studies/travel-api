class TravelsController < ApplicationController
#TODO : testes update e destroy e Serializer depois jobs(emails de boas vindas)
  def index
    lister = TravelManager::Lister.new(filters)
    render json: lister.build
  end

  def create
    creator = TravelManager::Creator.new(travel_params)
    result = creator.build
    return head :precondition_failed if result.invalid?
    render json: result
  end

  def update
    updater = TravelManager::Updater.new(params[:id], travel_params)
    render json: updater.build
  end

  def destroy
    destroyer = TravelManager::Destroyer.new(params[:id])
    render json: destroyer.build
  end

  private

  def travel_params
    params.permit(:destination, :origin, :departure_date, :return_date)
  end

  def filters
    {
      month: params[:month],
      departure_date: params[:departure_date],
      return_date: params[:return_date],
      locale: params[:locale],
      origin: params[:origin],
      destination: params[:destination]
    }
  end
end
