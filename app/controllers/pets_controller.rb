class PetsController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
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
end
