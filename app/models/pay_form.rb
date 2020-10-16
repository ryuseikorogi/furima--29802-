class PayForm
  include ActiveModel::Model
  attr_accessor :shipping_prefecture_id, :address, :zip_code, :city, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates  :city
    validates  :address
    validates  :phone_number, length: { maximum: 11 }
    validates  :token
    validates  :zip_code
  end
  validates :shipping_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invallid' }
  # ここにバリデーションの処理を書く

  def save
    test = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(shipping_prefecture_id: shipping_prefecture_id, address: address, zip_code: zip_code, city: city, building: building, phone_number: phone_number, purchase_id: test.id)

    # 各テーブルにデータを保存する処理を書く
  end
end
