##
# The location where a device is located.
# Used to display overviews etc.
#
class Location < ActiveRecord::Base
  has_many :devices
end
