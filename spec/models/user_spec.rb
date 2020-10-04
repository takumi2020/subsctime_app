require 'rails_helper'
describe User do
  describe '#create' do
    it "nameがない場合は登録できないこと" do
      user = User.new(name: "", email: "kkk@gmail.com", password: "0000aaaa", password_confirmation: "0000aaaa")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = User.new(name: "test", email: "", password: "0000aaaa", password_confirmation: "0000aaaa")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "不正なアドレス場合は登録できないこと" do
      user = User.new(name: "test", email: "kkkgmail.com", password: "0000aaaa", password_confirmation: "0000aaaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "不正なアドレス場合は登録できないこと" do
      user = User.new(name: "test", email: "kkk@gmailcom", password: "0000aaaa", password_confirmation: "0000aaaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "不正なアドレス場合は登録できないこと" do
      user = User.new(name: "test", email: "@gmail.com", password: "0000aaaa", password_confirmation: "0000aaaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordがない場合は登録できないこと" do
      user = User.new(name: "test", email: "kkk@gmail.com", password: "", password_confirmation: "0000aaaa")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password確認がない場合は登録できないこと" do
      user = User.new(name: "test", email: "kkk@gmail.com", password: "0000aaaa", password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "password一致しない場合は登録できないこと" do
      user = User.new(name: "test", email: "kkk@gmail.com", password: "0000aaaa", password_confirmation: "1111aaaa")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

  end
end