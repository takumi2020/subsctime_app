require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a name" do
      user = User.new(name: "", email: "kkk@gmail.com", password: "0000aaaa", password_confirmation: "0000aaaa")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  end
end