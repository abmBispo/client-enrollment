class Api::V1::TagsController < ApplicationController
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render json: @tag
    else
      render json: { errors: @tag.errors.messages }, status: 422
    end
  end

  private
  def tag_params
    params.permit(:name)
  end
end
