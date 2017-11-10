class ReviewsController < ApplicationController
  def create
    # raise "Yay, Im here!"
    review = Review.new(review_params)

    review.user_id = current_user.id
    review.product_id = params[:product_id]

    product = Product.find(params[:product_id])

    if review.save
      # Review.create(
      #   product_id: review.product_id,
      #   user_id: review.user_id,
      #   description: review.description,
      #   rating: review.rating
      # )
      redirect_to "/products/#{review.product_id}"
    else
      redirect_to "/products/#{review.product_id}"
    end
  end


  private

  def review_params
    params.require(:review).permit(
      :rating,
      :description,
      :product_id
    )
  end

end
