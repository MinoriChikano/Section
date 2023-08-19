FactoryBot.define do
  factory :response do
    association :user
    association :audio
  end
end
