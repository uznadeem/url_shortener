class RedirectionsController < ApplicationController
  before_action :set_redirection, only: [ :show, :redirect ]

  def new
    @redirection = Redirection.new
  end

  def create
    @redirection = Redirection.new(redirection_params)
    if @redirection.save
      redirect_to redirection_info_path(alias: @redirection.alias), notice: "URL has successfully been created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def redirect
    @redirection.visits.create!(ip_address: request.remote_ip)
    redirect_to @redirection.url_address, allow_other_host: true
  end

  private

  def set_redirection
    @redirection = Redirection.find_by(alias: params[:alias])
    if @redirection.nil?
      render plain: "URL not found", status: :not_found
    end
  end

  def redirection_params
    params.require(:redirection).permit(:url_address, :alias)
  end
end
