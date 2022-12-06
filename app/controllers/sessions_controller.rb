class SessionsController < ApplicationController
  def create
    user = user.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      render json: user, status: :created
    else
      render json: {
               errors: {
                 login: "Invalid username or password"
               }
             },
             status: :unauthorized
    end
  end
end
