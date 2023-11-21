class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @user = current_user
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.find_by(pet_id: @pet.id, user_id: current_user.id)
  end

  # def show
  #   @pet = Pet.find(params[:id])
  #   @booking = Booking.find_by(pet_id: @pet.id, user_id: current_user.id)
  #   @review = Review.new
  # end

  def create
    @review = Review.new(@review_params)
    @review.pet = @pet

    if @review.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
