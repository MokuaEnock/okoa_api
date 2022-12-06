class UsersController < ApplicationController
  wrap_parameters format: []

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  def show
    render json: @current_user
  end

  private

  #params
  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
