class MeasurementsController < ApplicationController
  before_action :find_device

  def index
    @measurements = @device.measurements
  end

  def create
    fail 'Secret does not match' unless @device.secret.present?
    fail 'Secret does not match' unless @device.secret == params[:secret]
    @measurement = Measurement.new(measurement_params)
    @measurement.device = @device
    if @measurement.save
    else
    end
    render text: 'abc'
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
