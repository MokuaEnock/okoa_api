class ApplicationController < ActionController::API
  include ActionController::Cookies

  def authorize
    @current_user = User.find_by(id: session[:user_id])
    unless session.include? :user_id
      return render json: { error: "Not Authorized" }, status: :unauthorized
    end
  end
end
