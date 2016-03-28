##
# Default measurements controller
#
class MeasurementsController < ApplicationController
  before_action :authenticate_user!, except: [:create] unless Rails.env == 'test'
  before_action :find_device

  def index
    @measurements = @device.measurements
  end

  def create
    fail 'Secret does not match' unless @device.secret?
    fail 'Secret does not match' unless @device.secret == params[:secret]
    @measurement = Measurement.new(measurement_params)
    @measurement.device = @device
    if @measurement.save
      render json: { status: 'success' }
    else
      render json: { status: 'failure' }
    end
  end

  def chart_data
    @measurements = @device.measurements
    render :chart_data
  end

  private

  def find_device
    @device = Device.find(params[:id])
  end

  def measurement_params
    params.require(:measurement).permit(:data)
  end
end
