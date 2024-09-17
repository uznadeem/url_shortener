class LogVisitJob < ApplicationJob
  queue_as :default

  def perform(redirection_id, ip_address)
    redirection = Redirection.find(redirection_id)
    redirection.visits.create!(ip_address: ip_address)
  end
end
