class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new

    @reviews_users = {}

    @product.reviews.each do |review|
      @reviews_users[review.id] = User.select("first_name, last_name").find(review.user_id)
    end

  end

end
