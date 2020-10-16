require 'rails_helper'

RSpec.describe PayForm, type: :model do

  describe '商品購入' do
    before do
      @seller = FactoryBot.create(:user)

      @buyer= FactoryBot.create(:user)
  
      @item = FactoryBot.create(:item, user_id: @seller.id)

      @pay_form = FactoryBot.build(:pay_form, user_id: @buyer.id,item_id:@item.id)
      sleep(1)
    end

    it "city_idが空だと登録できない" do
      @pay_form.city= ""
      @pay_form.valid?
      expect(@pay_form.errors.full_messages).to include("City can't be blank")
    end
    it "addressが空だと登録できない" do
      @pay_form.address= ""
      @pay_form.valid?
      expect(@pay_form.errors.full_messages).to include("Address can't be blank")
    end
    it "zip_codeが空だと登録できない" do
      @pay_form.zip_code= ""
      @pay_form.valid?
      expect(@pay_form.errors.full_messages).to include("Zip code can't be blank")
    end
  
    it "shipping_prefecture_idが空だと登録できない" do
      @pay_form.shipping_prefecture_id= ""
      @pay_form.valid?

      expect(@pay_form.errors.full_messages).to include("Shipping prefecture can't be blank")
    end

      it "phone_numberが空だと登録できない" do
        @pay_form.phone_number = ""
        @pay_form.valid?

        expect(@pay_form.errors.full_messages).to include("Phone number can't be blank")
      end
        it "tokenが空だと登録できない" do
          @pay_form.token = ""
          @pay_form.valid?
  
          expect(@pay_form.errors.full_messages).to include("Token can't be blank")
        end

          it "phone_numberが11文字以下であれば登録できないこと" do
            @pay_form.phone_number = "123456789012"
            @pay_form.valid?
            
            expect(@pay_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
          end
    end
  end