class Api::V1::ClientsController < ApplicationController
  def index
    @clients = Client.page(params[:page])
  end
end
