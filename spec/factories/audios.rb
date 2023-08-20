FactoryBot.define do
  factory :audio do
    association :user
    association :project
    title { "test" }
    bpm { "150" }
    key { "F♯" }
    file { File.open("#{Rails.root}/spec/fixtures/sample.mp3") }
    comment { "テスト" }
  end

  factory :second_audio, class: Audio do
    association :user
    association :project
    title { "test2" }
    bpm { "161" }
    key { "C" }
    comment { "テストです" }
  end
end
