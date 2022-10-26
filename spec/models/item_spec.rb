require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    binding.pry
  end

  describe 'ユーザー新規登録' do
    # ニックネーム
    it '●●が存在すれば登録できる' do
      expect(@item).to be_valid
    end

    # it 'nicknameが空では登録できない' do
    #   @user.nickname = ''
    #   @user.valid?
    #   expect(@user.errors.full_messages).to include("Nickname can't be blank")
    # end

  end
end
