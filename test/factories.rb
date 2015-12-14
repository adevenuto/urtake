FactoryGirl.define do
  factory :comment do
    association :user
    association :place

    message "Boy, I love this place!"
    rating "4_star"
  end
end
FactoryGirl.define do
  factory :user do
    sequence :email do |n|
              "person#{n}@example.com"
            end
    password "12345678"
    password_confirmation "12345678"
  end
end
FactoryGirl.define do
  factory :place do
    association :user

    name "earth"
    address "2345 milkyway dr."
    description "Round blue and filled with water"
  end
end