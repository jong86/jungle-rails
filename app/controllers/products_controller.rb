class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    # @rating = Review.average(:rating).where(product_id: params[:id])
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

end
