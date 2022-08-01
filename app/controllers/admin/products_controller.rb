class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
      flash[:notice] = "商品の登録が完了しました"
    else
      render "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product)
      flash[:notice] = "変更が完了しました"
    else
      render "edit"
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :ganre_id, :price, :image, :is_active)
  end

end
