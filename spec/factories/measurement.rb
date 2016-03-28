FactoryGirl.define do
  factory :measurement do
    association :device
    data {{ key: :temperature, value: 24 }}
  end
end
