class Api::V1::CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: customers
  end

  def create
    customer = Customer.create!(customer_attributes)
    render json: customer
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_attributes)
    render json: customer
  end

  private

  def customer_attributes
    params.require(:customer).permit(:name, :phone)
  end
end
