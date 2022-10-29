FactoryBot.define do
  factory :order_delivery do
    post_code              { '123-4567' }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    municipality           { '海南市' }
    house_number           { '中央区' }
    building_name          { '3番地' }
    phone_number           { '08012345678' }
  end
end
