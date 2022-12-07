class OrdersController < ApplicationController
  # skip_before_action :authorize, only: %i[create index show]
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActiveRecord::RecordInvalid, with: :render_422

  def index
    render json: Order.all
  end

  def create
    orders = Order.create!(order_params)
    render json: orders, status: :created
  end

  def show
    order = Order.find(params[:id])
    render json: order, status: :ok
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    head :no_content
  end

  private

  def order_params
    params.permit(
      :user_id,
      :name,
      :location,
      :weight,
      # :email,
      :wastetype,
      :instructions,
      :date
    )
  end

  def render_404
    render json: { error: "Category not found" }, status: :not_found
  end

  def render_422(invalid)
    render json: {
             errors: invalid.record.errors.full_messages
           },
           status: :unprocessable_entity
  end
end
