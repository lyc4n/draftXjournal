FactoryGirl.define do
  factory :user do
    sequence(:first_name){|n| "User#{n}"}
    last_name { %w{Canarias Cano Reyes Alas}.sample }
    sequence(:email){|n| "user#{n}@example.com"}
    password 'password'
    password_confirmation 'password'
    trait :with_drafts do
      transient do
        number_of_drafts 3
      end

      after(:build) do |user, evaluator|
        create_list(:draft, evaluator.number_of_drafts, user: user)
      end
    end
  end
end
