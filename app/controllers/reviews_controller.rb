class ReviewsController < ApplicationController
  def create
    @review = Review.create(review_params)
    puts "+++++++++++++++++++++++++++++++++++++++++++"
    puts @review.inspect
    puts "+++++++++++++++++++++++++++++++++++++++++++"

    if @review.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id,
      :user_id
    )
  end
end
