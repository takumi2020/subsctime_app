require 'rails_helper'
describe User do
  describe '#create' do
    it "name, email, password, password_confirmationが入力されていたら登録できること" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "@がないアドレス場合は登録できないこと" do
      user = build(:user, email: "kkkgmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "不正なアドレスgmailcom場合は登録できないこと" do
      user = build(:user, email: "kkk@gmailcom")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "アドレスの＠より前がない場合は登録できないこと" do
      user = build(:user, email: "@gmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "メールアドレスが同じ場合登録できないこと" do
      #はじめにユーザーを登録
      user = create(:user)
      #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password6文字の場合登録できないこと" do
      user = build(:user, password: "aaa111")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "password確認がない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "password一致しない場合は登録できないこと" do
      user = build(:user, password_confirmation: "1111aaaa")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

  end
end