class LocationsController < ApplicationController
  before_action :find_location, only: [:edit, :update, :destroy]

  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:success] = t('.success')
      render :edit
    else
      flash[:warning] = t('.failure')
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      flash[:success] = t('.success')
    else
      flash[:warning] = t('.failure')
    end
    render :edit
  end

  def destroy
    if @location.destroy
      flash[:success] = t('.success')
    else
      flash[:warning] = t('.failure')
    end
    redirect_to locations_path
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name)
  end
end
