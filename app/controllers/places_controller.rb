class PlacesController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
  def index
    @places = Place.order('created_at DESC').page(params[:page]).per(8).search(params[:q])
    @results = @places.result
    @photos = Photo.new
  end
  def new
    @place = Place.new
  end
  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
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
    params.require(:place).permit(:name, :address, :url, :phone_number, :description )
  end
end
