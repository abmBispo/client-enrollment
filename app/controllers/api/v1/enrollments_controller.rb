class Api::V1::EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      render json: @enrollment
    else
      render json: { errors: @enrollment.errors.messages }, status: 422
    end
  end

  private
  def enrollment_params
    params.permit(:name, :client_id, :tag_id)
  end
end
