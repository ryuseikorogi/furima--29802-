FactoryBot.define do
  factory :item do
    association :user
    item_name { 'name' }
    text { 'anyDiscription' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    genre_id { 1 }
    days_to_ship_id { 1 }
    shipping_burden_id { 1 }
    shipping_prefecture_id { 1 }
    condition_id { 1 }
    price { 3000 }
  end
end
