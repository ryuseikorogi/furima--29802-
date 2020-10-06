require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")

    #   user = FactoryBot.build(:user)  # Userのインスタンス生成
    #   user.nickname = ""  # nicknameの値を空にする
    #   user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
    #  user.valid?
    #  expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")

      # user = FactoryBot.build(:user)  # Userのインスタンス生成
      # user.email = ""  # emailの値を空にする
      # user = build(:user, email: nil)
      # user.valid?
      # expect(user.errors[:email]).to include("を入力してください")
    end 
    it "生年月日が全て入力しないと登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが半角英数以外だと登録できない" do
    end
    it "passwordが6文字以下だと登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "重複したemailが存在する場合登録できない" do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
end
end