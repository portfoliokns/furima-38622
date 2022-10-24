require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    # ニックネーム
    it 'nickname、email、password、password_confirmation、first_name、last_name、first_name_kana、last_name_kana、birth_dateが存在すれば登録できる' do
      binding.pry
      # expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
    end

    # メール
    it 'emailが空では登録できない' do
    end

    it '重複したemailが存在する場合は登録できない' do
    end

    it 'emailは@を含まないと登録できない' do
    end

    # パスワード
    it 'passwordが空では登録できない' do
    end

    it 'passwordが数値のみでは登録できない' do
    end

    it 'passwordが英字のみでは登録できない' do
    end

    it 'passwordが5文字以下では登録できない' do
    end

    it 'passwordが129文字以上では登録できない' do
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
    end

    # 姓名
    it 'first_nameが空では登録できない' do
    end

    it 'last_nameが空では登録できない' do
    end

    it 'first_nameに数字(半角)があると登録できない' do
    end

    it 'last_nameに数字(半角)があると登録できない' do
    end

    it 'first_nameに数字(全角)があると登録できない' do
    end

    it 'last_nameに数字(全角)があると登録できない' do
    end

    it 'first_nameに英字があると登録できない' do
    end

    it 'last_nameに英字があると登録できない' do
    end

    it 'first_nameにカタカナ(半角)があると登録できない' do
    end

    it 'last_nameにカタカナ(半角)があると登録できない' do
    end

    it 'first_nameに記号があると登録できない' do
    end

    it 'last_nameに記号があると登録できない' do
    end


    # 姓名（カナ）
    it 'first_name_kanaが空では登録できない' do
    end

    it 'last_name_kanaが空では登録できない' do
    end

    it 'first_name_kanaに数字(半角)があると登録できない' do
    end

    it 'last_name_kanaに数字(半角)があると登録できない' do
    end

    it 'first_name_kanaに数字(全角)があると登録できない' do
    end

    it 'last_name_kanaに数字(全角)があると登録できない' do
    end

    it 'first_name_kanaに英字があると登録できない' do
    end

    it 'last_name_kanaに英字があると登録できない' do
    end

    it 'first_name_kanaに漢字(全角)があると登録できない' do
    end

    it 'last_name_kanaに漢字(全角)があると登録できない' do
    end

    it 'first_name_kanaにひらがな(全角)があると登録できない' do
    end

    it 'last_name_kanaにひらがな(全角)があると登録できない' do
    end

    it 'first_nameにカタカナ(半角)があると登録できない' do
    end

    it 'last_nameにカタカナ(半角)があると登録できない' do
    end

    it 'first_name_kanaに記号があると登録できない' do
    end

    it 'last_name_kanaに記号があると登録できない' do
    end

    # 生年月日
    it 'birth_date(年)が空では登録できない' do
    end
    
    it 'birth_date(月)が空では登録できない' do
    end

    it 'birth_date(日)が空では登録できない' do
    end

  end
end
