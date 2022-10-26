FactoryBot.define do
  factory :item do
    name                     { Faker::Lorem.characters(number: 40) }
    description              { Faker::Lorem.characters(number: 1000) }
    category_id              { Faker::Number.between(from: 2, to: 11) }
    status_id                { Faker::Number.between(from: 2, to: 7) }
    payment_method_id        { Faker::Number.between(from: 2, to: 3) }
    prefecture_id            { Faker::Number.between(from: 2, to: 48) }
    shipping_day_id          { Faker::Number.between(from: 2, to: 4) }
    selling_price            { Faker::Number.between(from: 300, to: 9999999) }
    # user_id            { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
