class OrdersController < ApplicationController
  skip_before_action :authorize, only: :create

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
end
