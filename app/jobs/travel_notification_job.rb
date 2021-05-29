class TravelNotificationJob < ApplicationJob
  queue_as :notification

  def perform(*args)
    # Enviar email pro fedido quando estiver a 1 mes da viagem
    # só viagens confirmadas - confirmado? true, false
    # criar usuario
    # criar confirmação de viagem
    # se vai tratar o caso de cancelamento de viagem (job que verifica se continua confirmado e mata os que não estiverem)
    # TravelNotificationMailer.with(travel: travel).travel_is_coming.deliver_now
  end
end
