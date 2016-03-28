module Measurements
  ##
  # Measurements controller, prefilterd to archived, older measurements.
  #
  class ArchivesController < ::ApplicationController
    def index
      @measurements = @device.measurements.where('created_at < ?', DateTime.now - 7.days)
    end
  end
end
