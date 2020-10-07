require 'rails_helper'

describe Address do
  describe '#create' do
  
    it "全て入力されていればOK" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "名前が入力されてない場合NG" do
      address = build(:address, name: "")
      address.valid?
      expect(address.errors[:name]).to include("は不正な値です")
    end

    it "名前が英語で入力場合NG" do
      address = build(:address, name: "jack")
      address.valid?
      expect(address.errors[:name]).to include("は不正な値です")
    end

    it "名前に数字が含まれる場合NG" do
      address = build(:address, name: "山田太郎2")
      address.valid?
      expect(address.errors[:name]).to include("は不正な値です")
    end

    it "フリガナが入力されてない場合NG" do
      address = build(:address, name_kana: "")
      address.valid?
      expect(address.errors[:name_kana]).to include("は不正な値です")
    end

    it "フリガナが英字の場合NG" do
      address = build(:address, name_kana: "jack")
      address.valid?
      expect(address.errors[:name_kana]).to include("は不正な値です")
    end

    it "フリガナが英字の場合NG" do
      address = build(:address, name_kana: "jack")
      address.valid?
      expect(address.errors[:name_kana]).to include("は不正な値です")
    end

    it "フリガナがひらがなの場合NG" do
      address = build(:address, name_kana: "やまだたろう")
      address.valid?
      expect(address.errors[:name_kana]).to include("は不正な値です")
    end

    it "フリガナが漢字の場合NG" do
      address = build(:address, name_kana: "山田太郎")
      address.valid?
      expect(address.errors[:name_kana]).to include("は不正な値です")
    end

    it "フリガナに数字が含まれるの場合NG" do
      address = build(:address, name_kana: "ヤマダタロウ2")
      address.valid?
      expect(address.errors[:name_kana]).to include("は不正な値です")
    end


    it "postal_codeが空ならNG" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end
    it "postal_codeが意図しない形ならNG（全角）" do
      address = build(:address, postal_code: "１１１１１１１")
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_codeが1桁の場合NG" do
      address = build(:address, postal_code: "1")
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_codeが6桁の場合NG" do
      address = build(:address, postal_code: "123456")
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_codeが8桁の場合NG" do
      address = build(:address, postal_code: "12345678")
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_codeにハイフンがある場合NG" do
      address = build(:address, postal_code: "1234-567")
      address.valid?
      expect(address.errors[:postal_code]).to include("は不正な値です")
    end
    
    it "prefecture_idが選択されてなければNG" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end


    it "addressが空ならNG" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end
    it "house_numberが空ならNG" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end

    it "tellが空ならNG" do
      address = build(:address, tell: nil)
      address.valid?
      expect(address.errors[:tell]).to include("を入力してください")
    end

    
  end
end