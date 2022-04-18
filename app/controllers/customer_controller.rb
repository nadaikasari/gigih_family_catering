class CustomerController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy ]
  
  def index
    @customers = params[:letter].nil? ? Customer.all : Customer.by_letter(params[:letter])
  end

  def show
  end

  def new
  end

  def edit
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end
  
  def customer_params
    params.require(:customer).permit(:name, :email, :phone)
  end
end
