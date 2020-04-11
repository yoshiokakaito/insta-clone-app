FactoryBot.define do
  factory :user do
      name "Aaron"
      user_name "Sumner"
      sequence(:email) { |n| "tester#{n}@example.com" }
      password_digest "foobar"
  end
end
