FactoryGirl.define do
  factory :device do
    name 'Name of device'
    association :location, name: 'Name of Room'
  end
end
