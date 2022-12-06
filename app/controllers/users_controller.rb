class UsersController < ApplicationController
  wrap_parameters format: []
  rescue_from ActiveRecord::RecordInvalid, with: :render_uprocessable_entity

  def create
    user = User.create!(user_params)
  end

  def show
    current_user = User.find(session[:user_id])
    redner json: current_user
  end

  private

  #error handling
  def render_uprocessable_entity(invalid)
    render json: { error: invalid.record.errors }, status: :unprocessable_entity
  end

  #params
  def user_params
    params.permit(:username, :password)
  end
end
