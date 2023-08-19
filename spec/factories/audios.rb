FactoryBot.define do
  factory :audio do
    association :user
    association :project
    title { "test" }
    bpm { "150" }
    key { "F♯" }
    comment { "テスト" }
  end
end
