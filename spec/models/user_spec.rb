require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーの情報が投稿できる場合' do
      it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザーの情報が投稿できない場合' do      
      # ニックネーム
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
  
      # メール
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
  
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
  
      it 'emailは@を含まないと登録できない' do
        @user.email = 'konishigmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
  
      # パスワード
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'passwordが数値のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
  
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcDEF'
        @user.password_confirmation = 'abcDEF'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
  
      it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
  
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
  
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード入力'
        @user.password_confirmation = 'パスワード入力'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
  
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      # 姓名
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
  
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
  
      it 'first_nameに数字(半角)があると登録できない' do
        @user.first_name = '3陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
  
      it 'last_nameに数字(半角)があると登録できない' do
        @user.last_name = '3山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
  
      it 'first_nameに数字(全角)があると登録できない' do
        @user.first_name = '３陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
  
      it 'last_nameに数字(全角)があると登録できない' do
        @user.last_name = '３山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
  
      it 'first_nameに英字があると登録できない' do
        @user.first_name = 'aA陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
  
      it 'last_nameに英字があると登録できない' do
        @user.last_name = 'aA山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
  
      it 'first_nameにカタカナ(半角)があると登録できない' do
        @user.first_name = 'ﾘｸﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
  
      it 'last_nameにカタカナ(半角)があると登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
  
      it 'first_nameに記号があると登録できない' do
        @user.first_name = '@陸太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters')
      end
  
      it 'last_nameに記号があると登録できない' do
        @user.last_name = '@山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid. Input full-width characters')
      end
  
      # 姓名（カナ）
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
  
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
  
      it 'first_name_kanaに数字(半角)があると登録できない' do
        @user.first_name_kana = '3リクタロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
  
      it 'last_name_kanaに数字(半角)があると登録できない' do
        @user.last_name_kana = '3ヤマダ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
  
      it 'first_name_kanaに数字(全角)があると登録できない' do
        @user.first_name_kana = '３リクタロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
  
      it 'last_name_kanaに数字(全角)があると登録できない' do
        @user.last_name_kana = '３ヤマダ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
  
      it 'first_name_kanaに英字があると登録できない' do
        @user.first_name_kana = 'aAリクタロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
  
      it 'last_name_kanaに英字があると登録できない' do
        @user.last_name_kana = 'aAヤマダ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
  
      it 'first_name_kanaに漢字(全角)があると登録できない' do
        @user.first_name_kana = '陸タロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
  
      it 'last_name_kanaに漢字(全角)があると登録できない' do
        @user.last_name_kana = '山ダ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
  
      it 'first_name_kanaにひらがな(全角)があると登録できない' do
        @user.first_name_kana = 'りくタロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
  
      it 'last_name_kanaにひらがな(全角)があると登録できない' do
        @user.last_name_kana = 'やまダ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
  
      it 'first_nameにカタカナ(半角)があると登録できない' do
        @user.first_name_kana = 'ﾘｸタロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
  
      it 'last_nameにカタカナ(半角)があると登録できない' do
        @user.last_name_kana = 'ﾔﾏダ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
  
      it 'first_name_kanaに記号があると登録できない' do
        @user.first_name_kana = '@タロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters')
      end
  
      it 'last_name_kanaに記号があると登録できない' do
        @user.last_name_kana = '@ダ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid. Input full-width katakana characters')
      end
  
      # 生年月日
      it 'birth_date(年)が空では登録できない' do
        @user.birth_date = 'Sat, 11 Sep'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
  
      it 'birth_date(月)が空では登録できない' do
        @user.birth_date = 'Sat, 11 2004'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
  
      it 'birth_date(日)が空では登録できない' do
        @user.birth_date = 'Sat, Sep 2004'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
