class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    # raise "Yay, Im here!"
    review = Review.new(review_params)

    review.user_id = current_user.id
    review.product_id = params[:product_id]

    if review.save
      redirect_to "/products/#{review.product_id}"
    else
      redirect_to "/products/#{review.product_id}"
    end
  end

  def destroy
    # byebug
    Review.find(params[:review_id]).destroy
    redirect_to "/products/#{params[:id]}"
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
