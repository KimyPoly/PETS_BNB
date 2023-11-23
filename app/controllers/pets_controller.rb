class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
    @pets = @pets.where(race: params[:race]) if params[:race].present?
    @pets = @pets.where(habitat: params[:habitat]) if params[:habitat].present?

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { pet: pet }),
        marker_html: render_to_string(partial: "marker", locals: { pet: pet })
      }
    end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
    @review = Review.new
    @booking = Booking.new
    @average_rating = calculate_average_rating(@pet)

    @pet.geocode
    @marker = [{
        lat: @pet.latitude,
        lng: @pet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { pet: @pet }),
        marker_html: render_to_string(partial: "marker", locals: { pet: @pet })
      }]
  end

  def update
    @pet.update(pet_params)
    redirect_to root_path
  end

  def destroy
    @pet.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_params
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :race, :habitat, :age, :species, :description, :photo_url)
  end

  def calculate_average_rating(pet)
    if pet.reviews.present?
      total_ratings = pet.reviews.sum(:rating)
      total_reviews = pet.reviews.count
      average_rating = total_ratings.to_f / total_reviews
      return average_rating.round(1)
    else
      return 0
    end
  end
end
