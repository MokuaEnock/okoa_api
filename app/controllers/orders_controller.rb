class OrdersController < ApplicationController
  skip_before_action :authorize, only: :index

  def index
    render json: Order.all
  end

  def create
    recipe = @current_user.orders.create!(order_params)
    render json: recipe, status: :created
  end

  def show
    recipe = Order.find(params[:id])
    render json: recipe, status: :ok
  end

  private

  def order_params
    params.permit(:name, :location, :weight, :type, :instructions, :date)
  end
end
