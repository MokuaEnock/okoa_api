class ApplicationController < ActionController::API
  include ActionController::Cookies

  def authorize
    @current_user = User.find_by(id: session[:user_id])
    unless session.include? :user_id
      return render json: { error: "Not Authorized" }, status: :unauthorized
    end
  end

  def render_unprocessable_entity_response(exception)
    render json: {
             errors: exception.record.errors.full_messages
           },
           status: :unprocessable_entity
  end
  
end
