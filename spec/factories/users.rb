FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 1)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {Faker::Name.initials(number: 1)}
    first_name            {Faker::Name.initials(number: 1)}
    family_name_kana      {Faker::Name.initials(number: 1)}
    first_name_kana       {Faker::Name.initials(number: 1)}
    birth_day             {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
  end
end