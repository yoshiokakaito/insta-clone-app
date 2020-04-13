FactoryBot.define do
  factory :micropost do
    content "test_content"
    association :user
  end
end
