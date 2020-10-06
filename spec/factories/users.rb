FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    family_name          {"田中"}
    first_name           {"太郎"}
    family_name_kana    {"タナカ"}
    first_name_kana      {"タロウ"}
    birth_day           {"1997-10-18"}
    password              {"00000000"}
    password_confirmation {password}
  end
end