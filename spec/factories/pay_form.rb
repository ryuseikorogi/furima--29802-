FactoryBot.define do
  factory :pay_form do
    phone_number { '00000000000' }
    zip_code { '123-4567' }
    city { 'city' }
    address { 'address' }
    building { 'building' }
    shipping_prefecture_id { 1 }
    token { 'token' }
    association :user
    association :item
  end
end
