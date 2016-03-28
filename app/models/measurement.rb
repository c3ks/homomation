##
# Measurements objects contain data collected by any sensors at one time.
# Each Measurement belongs to a device.
#
class Measurement < ActiveRecord::Base
  belongs_to :device

  serialize :data
end
