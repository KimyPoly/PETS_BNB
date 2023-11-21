class PagesController < ApplicationController
  def home
  end

  def dashboard
    @user = current_user
    @bookings = @user.bookings #my bookings
    # demande sur mes animaux
    @pets = @user.pets
  end
end
