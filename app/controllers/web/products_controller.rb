class Web::ProductsController < Web::ApplicationController
  before_action :find_product, only: [:show, :edit, :destroy]

  def index
    @products = current_user.products
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render "new"
    end
  end

  def update
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end

  def find_product
    @product = current_user.products.find(params[:id])
  end
end
