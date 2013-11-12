class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]

  def index
    @customer = Customer.new
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      flash[:success] = "#{@customer.name} was successfully updated."
      redirect_to customers_path, notice: 'Customer was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @customer.update(customer_params)
      flash[:success] = "#{@customer.name} was successfully created."
      redirect_to customers_path
    else
      render action: 'edit'
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
    end
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :phone)
  end
end
