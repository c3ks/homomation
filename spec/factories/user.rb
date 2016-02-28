FactoryGirl.define do
  factory :user do
    email 'guest@homomation.de'
    password '12345678'
    password_confirmation '12345678'
    association :group, title: 'Guest'
  end

  factory :admin, class: User do
    email 'admin@homomation.de'
    password '12345678'
    password_confirmation '12345678'
    association :group, title: 'Admin'
  end
end
