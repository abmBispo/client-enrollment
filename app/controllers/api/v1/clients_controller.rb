class Api::V1::ClientsController < ApplicationController
  def index
    @clients = Client.page(params[:page]).per(clients_per_page)
    render json: @clients
  end

  private
  def clients_per_page
    params[:per_page] || 25
  end
end
