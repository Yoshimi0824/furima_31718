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
    end

    
end
