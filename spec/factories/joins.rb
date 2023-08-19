FactoryBot.define do
  factory :join do
    association :user
    association :project
  end
end
