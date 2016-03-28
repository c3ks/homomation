class Measurement < ActiveRecord::Base
  belongs_to :device

  serialize :data
end
