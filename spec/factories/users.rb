FactoryBot.define do
  factory :user do
    name { "test" }
    email { "testtest@email.com" }
    password { "123456" }
    admin {true}
  end

  factory :second_user, class: User do
    name { "test2" }
    email { "test2@email.com" }
    password { "123456" }
    admin {false}
  end

  factory :third_user, class: User do
    name { "chikano" }
    email { "2305@email.com" }
    password { "123456" }
    admin {false}
  end
end
