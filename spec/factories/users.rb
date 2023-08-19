FactoryBot.define do
  factory :user do
    name { "test" }
    email { "test@email.com" }
    password { "123456" }
    admin {true}
  end
end
