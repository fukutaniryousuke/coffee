class Admin::ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
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
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :ganre_id, :price, :image, :is_active)
  end

end
