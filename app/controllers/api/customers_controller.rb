class Api::CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: customers
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