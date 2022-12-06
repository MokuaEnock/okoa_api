class UsersController < ApplicationController
  wrap_parameters format: []

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  def show
    redner json: @current_user
  end

  private

  #params
  def user_params
    params.permit(:username, :password)
  end
end
