require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
  before do
    
    @item = FactoryBot.build(:item)
  end

  it "item_nameが空だと登録できない" do
    @item.item_name = ""
    @item.valid?
  
    expect(@item.errors.full_messages).to include("Item name can't be blank")
  end

  it "textが空では登録できない" do
    @item.text = ""
    @item.valid?
    
    expect(@item.errors.full_messages).to include("Text can't be blank")
  end

  it "genreが空だと出品できない" do
    @item.genre_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Genre is not a number")
  end

   it "days_to_shipが空だと出品ができない" do
    @item.days_to_ship_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Days to ship can't be blank")
  end

   it "shipping_burdenが空だと出品ができない" do
    @item.shipping_burden_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
  end

   it "shippingh_prefectureが空だと出品ができない" do
    @item.shipping_prefecture_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping prefecture can't be blank")
  end

  it "conditionが空だと出品ができない" do
    @item.condition_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end

  it "priceが空だと出品ができない" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it "priceが300円以上100000000円以下じゃないと出品できない" do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Price Out of setting range")
  end

  it "imageファイルが選択されていないと出品できない" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
 end
end