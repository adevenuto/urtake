class PlacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @places = Place.order('created_at DESC').page(params[:page]).per(5).page(params[:page]).per(5)
    # @places = Place.search((params[:q].present? ? params[:q] : '*')).records
  end
  def new
    @place = Place.new
  end
  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render :text => 'SORRY :(', :status => :forbidden
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user && current_user
      return render :text => 'SORRY :(', :status => :forbidden
    end
    @place.update_attributes(place_params)
    redirect_to root_path
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user && current_user
      return render :text => 'SORRY :(', :status => :forbidden
    end
    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end
end
