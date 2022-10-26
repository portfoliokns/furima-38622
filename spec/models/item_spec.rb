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
      # 画像
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      # 商品名や商品説明
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが41文字以上では登録できない' do
        @item.name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'descriptionが1001文字以上では登録できない' do
        @item.description = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end

      # プルダウン
      it 'category_idが空(---)では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが空(---)では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'payment_method_idが空(---)では登録できない' do
        @item.payment_method_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment method can't be blank")
      end

      it 'prefecture_idが空(---)では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_day_idが空(---)では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      # 販売価格
      it 'selling_priceが空では登録できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end

      it 'selling_priceが299以下の数値では登録できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be greater than or equal to 300')
      end

      it 'selling_priceが10,000,000以上の数値では登録できない' do
        @item.selling_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be less than or equal to 9999999')
      end

      it 'selling_priceが小数点以下を持つ場合登録できない' do
        @item.selling_price = 300.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price must be an integer')
      end

      it 'selling_priceが全角入力(ひらがな)では登録できない' do
        @item.selling_price = 'ぜんかく'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'selling_priceが全角入力(漢字)では登録できない' do
        @item.selling_price = '全角'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'selling_priceが全角入力(カタカナ)では登録できない' do
        @item.selling_price = 'ゼンカク'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'selling_priceが全角入力(記号)では登録できない' do
        @item.selling_price = '＠'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'selling_priceが全角入力(数字)では登録できない' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'selling_priceが半角入力(英語)では登録できない' do
        @item.selling_price = Faker::Lorem.characters(number: 1, min_alpha: 1)
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'selling_priceが半角入力(ｶﾀｶﾅ)では登録できない' do
        @item.selling_price = 'ﾊﾝｶｸ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'selling_priceが半角入力(記号)では登録できない' do
        @item.selling_price = '-'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it 'ユーザーが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
