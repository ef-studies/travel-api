class TravelNotificationMailer < ApplicationMailer
  def travel_is_coming
    @travel = params[:travel]
    mail(to: 'user@mail.com.br', subject: 'Sua viagem está chegando!')
  end
end
