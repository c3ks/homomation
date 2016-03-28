##
# Devices deliver data in the form of measurements.
#
class Device < ActiveRecord::Base
  belongs_to :location
  has_many :measurements

  validates :name, presence: true
  validates :location, presence: true
  validates :secret, presence: true

  before_validation do |d|
    d.secret ||= SecureRandom.hex(128) # generates 256 random chars
  end
end
