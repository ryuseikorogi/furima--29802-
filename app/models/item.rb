class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :days_to_ship
  belongs_to :user

  VALID_PRICEL_REGEX =  /\A[0-9]+\z/

  with_options presence: true  do
    validates  :item
    validates  :text
    validates  :condition
    validates  :shipping_burden
    validates  :shipping_prefecture
    validates  :days_to_ship
    validates :image
  end

    validates :genre_id, numericality: { other_than: 0 }

    validates :condition_id, numericality: { other_than: 0 }

    validates :shipping_burden_id, numericality: { other_than: 0 }

    validates :shipping_prefecture_id, numericality: { other_than: 0 }

    validates :days_to_ship_id, numericality: { other_than: 0 }
   
    validates_inclusion_of  :price, in: 300..10000000, message: "Price Out of setting range"

    validates :price, numericality: {with: /\A[0-9]+\z/} 

end