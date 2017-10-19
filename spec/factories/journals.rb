FactoryGirl.define do
  factory :journal do
    user nil
    year 2017
    status Journal.statuses[:active]

    trait :active do
      status Journal.statuses[:active]
    end

    trait :inactive do
      status Journal.statuses[:inactive]
    end
  end
end
