class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @user = current_user
    @booking = Booking.find(params[:booking_id])
    @pet = @booking.pet_id
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to pet_path(@booking.pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
