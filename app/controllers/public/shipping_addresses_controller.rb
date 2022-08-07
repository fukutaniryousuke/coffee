class Public::ShippingAddressesController < ApplicationController
  
  def index
    @shipping_address = ShippingAddress.new
  end
  
  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      redirect_to shipping_addresses_path
      flash[:notice] = "登録が完了しました"
    else
      render "index"
    end
  end
  
  def edit
  end
  
  private
  
  def shipping_address_params
    params.require(:shipping_address).permit(:postcode, :address, :name, :customer_id)
  end
end
