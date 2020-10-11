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
    validates  :item_name
    validates  :text
    validates  :condition
    validates  :shipping_burden
    validates  :shipping_prefecture
    validates  :days_to_ship
    validates :image
    validates :price
  end

  with_option numericality: { other_than: 0 } do
    
    validates :genre_id

    validates :condition_id

    validates :shipping_burden_id

    validates :shipping_prefecture_id

    validates :days_to_ship_id
  end

    validates_inclusion_of  :pricein: 300..10000000message: "Price Out of setting range"

    validates :pricenumericality: {with: /\A[0-9]+\z/}

end