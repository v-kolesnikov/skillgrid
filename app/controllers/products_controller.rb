class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy, :set_pro]
  before_action :authenticate_user!, except: [:index]
  before_action :shop_require, only: [:new, :edit, :create, :destroy, :my]
  before_action :shop_owner_require, only: [:edit, :update, :destroy]
  before_action :admin_require, only: [:set_pro]

  def index
    if current_user
      @products = Product.all
    else
      @products = Product.for_guests
    end
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = @shop.products.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render "new"
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated."
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def set_pro
    @product.pro = !@product.pro?
    if @product.save!
      redirect_to products_path
    else
      flash[:danger] = "Error set pro"
      redirect_to products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image, :pro?)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def admin_require
    redirect_to root_path unless current_user.account.is_a?(Admin)
  end

  def shop_owner_require
    unless @product.owned_by?(current_user)
      flash[:danger] = "Access denied!"
      redirect_to products_path
    end
  end

  def shop_require
    if current_user.account.is_a?(ShopOwner)
      @shop = current_user.account
    else
      redirect_to root_path
    end
  end
end
