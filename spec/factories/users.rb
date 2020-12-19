FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 1)}
    email                 {Faker::Internet.free_email}
    password              {"terai0"}
    password_confirmation {password}
    family_name           {"寺井"}
    first_name            {"大樹"}
    family_name_kana      {"テライ"}
    first_name_kana       {"ヒロキ"}
    birth_day             {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
  end
end