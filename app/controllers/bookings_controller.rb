class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    @booking.save
    redirect_to list_path(@list)
  end

  def destroy
    @booking.destroy
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
