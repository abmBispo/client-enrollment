class Api::V1::ClientsController < ApplicationController
  before_action :check_for_enrollment_ids, only: %i[create]

  def index
    @clients = Client.includes(:tags).page(params[:page]).per(clients_per_page)
    render json: {
      last_page: @clients.last_page?,
      total_pages: @clients.total_pages,
      clients: ActiveModelSerializers::SerializableResource.new(@clients)
    }
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      render json: @client
    else
      render json: { errors: @client.errors.messages }, status: 422
    end
  end

  private
  def clients_per_page
    params[:per_page] || 25
  end

  def client_params
    params.permit(:name, :email, enrollment_ids: [])
  end

  def check_for_enrollment_ids
    return if client_params[:enrollment_ids].nil?
    invalid_ids = params[:enrollment_ids].reject { |id| Enrollment.exists? id }
    return if invalid_ids.empty?

    render json: {
      errors: {
        enrollment_ids: I18n.t('activerecord.errors.models.client.attributes.enrollment_ids.invalid', ids: invalid_ids.join(', '))
      }
    }
  end
end
