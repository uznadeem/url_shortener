class VisitsChannel < ApplicationCable::Channel
  def subscribed
    redirection = Redirection.find_by(alias: params[:alias])
    stream_for redirection if redirection
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
