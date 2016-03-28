class Device < ActiveRecord::Base
  belongs_to :location
  has_many :measurements

  validates :name, presence: true
  validates :location, presence: true
end
