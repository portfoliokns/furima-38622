require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の新規登録' do
    context '商品の情報が投稿できる場合' do
      it 'image name description category_id status_id payment_method_id prefecture_id shipping_day_id selling_price userが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の情報が投稿できない場合' do
      #画像
      it 'imageが空では登録できない' do
        # @user.name = ''
        # @user.valid?
        # expect(@user.errors.full_messages).to include("name can't be blank")
      end
  
      #商品名や商品説明
      it 'nameが空では登録できない' do
      end
  
      it 'nameが41文字以上では登録できない' do
      end
  
      it 'descriptionが空では登録できない' do
      end
  
      it 'descriptionが10001文字以上では登録できない' do
      end
  
      #プルダウン
      it 'category_idが空(---)では登録できない' do
      end
  
      it 'status_idが空(---)では登録できない' do
      end
  
      it 'payment_method_idが空(---)では登録できない' do
      end
  
      it 'prefecture_idが空(---)では登録できない' do
      end
  
      it 'shipping_dayが空(---)では登録できない' do
      end
  
      #販売価格
      it 'selleing_priceが空では登録できない' do
      end
  
      it 'selleing_priceが299以下の数値では登録できない' do
      end
  
      it 'selleing_priceが10,000,000以上の数値では登録できない' do
      end
  
      it 'selleing_priceが全角入力では登録できない' do
      end
  
      it 'selleing_priceが半角入力(英語)では登録できない' do
      end
  
      it 'selleing_priceが半角入力(ｶﾀｶﾅ)では登録できない' do
      end
  
      it 'selleing_priceが半角入力(記号)では登録できない' do
      end
      
      it 'ユーザーが紐づいていなければ登録できない' do
      end

    end
  end
end
