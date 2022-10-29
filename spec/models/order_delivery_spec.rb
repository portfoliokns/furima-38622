require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '購入情報の登録' do
    before do
      user = FactoryBot.create(:user)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id)
    end

    context '購入情報を正しく入力している場合' do
      it 'すべての値(post_code prefecture_id municipality house_number building_name phone_number order_id user_id item_id) が入力されていれば登録できる' do
        # expect(@order_delivery).to be_valid
      end

      it ' building_nameが空欄でも登録できる' do
        # expect(@order_delivery).to be_valid
      end
    end

    context '購入情報を正しく入力していない場合' do
      it 'post_codeが空では登録できない' do
        # @order_delivery.post_code = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'prefecture_idが空(---)では登録できない' do
      end

      it 'prefecture_idが正しいフォーマット(123-456)でないと登録できない' do
      end
      
      it 'municipalityが空では登録できない' do
      end

      it 'house_numberが空では登録できない' do
      end

      it 'phone_numberが空では登録できない' do
      end

      it 'phone_numberが半角数字意外では登録できない' do
      end

      it 'phone_numberの数字が10桁または11桁でないと登録できない' do
      end

      it 'order_idが空では登録できない' do
      end

      it 'user_idが空では登録できない' do
      end

      it 'item_idが空では登録できない' do
      end

    end
  end
end