class OrdersController < ApplicationController
  def index
    render json: Order.all
  end

  def create
    recipe = @current_user.orders.create!(order_params)
    redner json: recipe, status: :created
  end

  private

  def order_params
    params.permit(:name, :location, :weight, :type, :instructions, :date)
  end
end
