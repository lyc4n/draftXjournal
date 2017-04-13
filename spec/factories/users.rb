FactoryGirl.define do
  factory :user do
    sequence(:first_name){|n| "User#{n}"}
    last_name { %w{Canarias Cano Reyes Alas}.sample }
    sequence(:email){|n| "User#{n}"}
    encrypted_password User.new.send(:password_digest, 'password')
  end
end
