class UsersController < ApplicationController
  wrap_parameters format: []

  def create
    user = User.create!(user_params)
  end

  def show
    current_user = User.find(session[:user_id])
    redner json: current_user
  end

  private

  #params
  def user_params
    params.permit(:username, :password)
  end
end
