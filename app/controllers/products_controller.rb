class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authorize_product, except: :index

  def index
    products = SortProductsQuery.call(Product.all, params)
    @categories = Category.left_joins(:products).group(:id).select("categories.id, categories.title, COUNT(products.id) as products_count")
    @pagy, @products = pagy(products)
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  def fetch_products
    ProductJob.set(wait: 10.seconds).perform_now

    redirect_to root_path, notice: "Products was successfully created."
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, images: [])
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def authorize_product
    authorize @product.presence || Product.new
  end
end
