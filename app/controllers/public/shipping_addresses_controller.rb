class Public::ShippingAddressesController < ApplicationController

  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = current_customer.shipping_addresses.all
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      redirect_to shipping_addresses_path
      flash[:notice] = "登録が完了しました"
    else
      @shipping_addresses = current_customer.shipping_addresses.all
      render "index"
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path
      flash[:notice] = "配送先の変更が完了しました"
    else
      render "edit"
    end
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:postcode, :address, :name, :customer_id)
  end
end
