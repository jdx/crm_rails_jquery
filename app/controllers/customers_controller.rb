class CustomersController < ApplicationController
  def index
    @customer = Customer.new
    @customers = Customer.order('name')
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
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
    respond_to do |format|
      @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        format.html do
          flash[:success] = "#{@customer.name} was successfully created."
          redirect_to customers_path
        end
        format.js
      else
        format.html { render action: 'edit' }
        format.js
      end
    end
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to customers_url
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :phone)
  end
end
