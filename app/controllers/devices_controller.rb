##
# Default devices controller
#
class DevicesController < ApplicationController
  before_action :authenticate_user! unless Rails.env == 'test'
  before_action :find_device, only: [:edit, :update, :destroy]

  def index
    @devices = Device.all
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)
    if @device.save
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
    if @device.update(device_params)
      flash[:success] = t('.success')
    else
      flash[:warning] = t('.failure')
    end
    render :edit
  end

  def destroy
    if @device.destroy
      flash[:success] = t('.success')
      redirect_to devices_path
    else
      flash[:warning] = t('.failure')
      redirect_to :back
    end
  end

  private

  def find_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name, :location_id, :info)
  end
end
