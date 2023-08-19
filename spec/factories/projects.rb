FactoryBot.define do
  factory :project do
    user { FactoryBot.create(:user)}
    name { "test" }    
  end
end
