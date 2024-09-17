class VisitsController < ApplicationController
  before_action :set_redirection

  def index
    @visits = @redirection.visits.order(created_at: :desc)
  end

  private

  def set_redirection
    @redirection = Redirection.find_by(alias: params[:alias])

    render plain: "URL not found", status: :not_found if @redirection.nil?
  end
end
