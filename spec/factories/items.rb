FactoryBot.define do
  factory :item do
    introduction {Faker::Lorem.sentence}
    name{Faker::Name.initials(number: 1)}
    category_id   {2}
    status_id     {2}
    charge_id     {2}
    prefecture_id {2}
    ship_date_id  {2}
    price         {5000}

    user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test.png'),filename: 'test.png')
      end


  end
end
