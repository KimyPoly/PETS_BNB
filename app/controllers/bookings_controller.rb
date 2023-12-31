class BookingsController < ApplicationController
  before_action :set_booking, only: [:accept, :decline, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @user = current_user
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    @pet = Pet.find(params[:pet_id])
    @booking.user = @user
    @booking.pet = @pet
    @booking.save
    # redirect_to dashboard_path
  end

  def accept
    @booking.status = "Accepted"
    if @booking.save
      redirect_to dashboard_path
    end
  end

  def decline
    @booking.status = "Declined"
    if @booking.save
      redirect_to dashboard_path
    end
  end

  def destroy
    @booking.destroy
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :pet_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
