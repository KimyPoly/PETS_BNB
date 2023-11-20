class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @pet = Pet.find(params[:pet_id])
    @review.pet = @pet
    if @review.save
      redirect_to '/pets/:id/'
    else
      @review = Review.new
      render '/pets/:pet_id/booking/:booking_id/reviews', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
