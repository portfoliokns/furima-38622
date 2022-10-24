FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"翔太"}
    last_name             {"小西"}
    first_name_kana       {"ショウタ"}
    last_name_kana        {"コニシ"}
    birth_date            {"1992-08-15"}
  end
end
