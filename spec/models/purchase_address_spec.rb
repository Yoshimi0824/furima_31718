require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能' do
    context '購入がうまくいくとき' do
      it '全ての項目を記入すると購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @purchase_address.building_name = " "
        expect(@purchase_address).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が必須であること' do
        @purchase_address.postal_code = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県が必須であること' do
        @purchase_address.sender = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Sender Select')
      end
      it '市区町村が必須であること' do
        @purchase_address.municipality = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が必須であること' do
        @purchase_address.street_number = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street number can't be blank")
      end
      it '電話番号が必須であること' do
        @purchase_address.phone_number = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'カード情報(token)が必須であり、間違ったカード情報ではないこと' do
        @purchase_address.token = ' '
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号にはハイフンが必要であること(123-4567となる)' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '電話番号は11桁以内でないと購入できない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it '電話番号は数字のみでないと（ハイフンが含まれていると）購入できない' do
        @purchase_address.phone_number = '090-123-456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Except hyphen(-)")
      end
    end
  end
end
