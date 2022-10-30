require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入情報の登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入情報を正しく入力している場合' do
      it 'すべての値(post_code prefecture_id municipality house_number building_name phone_number order_id user_id item_id) が正しく入力されていれば登録できる' do
        expect(@order_delivery).to be_valid
      end

      it ' building_nameが空欄でも登録できる' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end

      it ' phone_numberが10桁でも登録できる' do
        @order_delivery.phone_number = '0801234567'
        expect(@order_delivery).to be_valid
      end
    end

    context '購入情報を正しく入力していない場合' do
      it 'post_codeが空では登録できない' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      
      it 'post_codeが正しいフォーマット(123-4567)でないと登録できない' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end

      it 'prefecture_idが空(---)では登録できない' do
        @order_delivery.prefecture_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalityが空では登録できない' do
        @order_delivery.municipality = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberが空では登録できない' do
        @order_delivery.house_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("House number can't be blank")
      end
      
      it 'phone_numberが空では登録できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字意外では登録できない' do
        @order_delivery.phone_number = '090-1234-5678'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid. Input only number")
      end

      it 'phone_numberの数字が9桁以下では登録できない' do
        @order_delivery.phone_number = '080123456'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is too short")
      end

      it 'phone_numberの数字が12桁以上では登録できない' do
        @order_delivery.phone_number = '080123456789'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is too short")
      end

      it 'user_idが空では登録できない' do
        @order_delivery.user_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できない' do
        @order_delivery.item_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end