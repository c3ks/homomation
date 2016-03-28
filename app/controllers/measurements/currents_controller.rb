module Measurements
  ##
  # Measurements controller, prefilterd to current measurements.
  #
  class CurrentsController < ::ApplicationController
    def index
      @measurements = @device.measurements.where('created_at >= ?', DateTime.now - 7.days)
    end
  end
end
