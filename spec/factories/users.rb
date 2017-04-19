FactoryGirl.define do
  factory :user do
    sequence(:first_name){|n| "User#{n}"}
    last_name { %w{Canarias Cano Reyes Alas}.sample }
    sequence(:email){|n| "user#{n}@example.com"}
    encrypted_password User.new.send(:password_digest, 'password')

    trait :with_stubbed_drafts do
      transient do
        number_of_drafts 3
      end

      after(:build) do |user, evaluator|
        1.upto(evaluator.number_of_drafts) do
          user.drafts << FactoryGirl.build_stubbed(:draft, user: :user)
        end
      end
    end
  end
end
