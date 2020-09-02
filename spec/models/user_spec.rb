require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do 
    
    context 'ユーザー登録が出来るとき' do
    
      it '全ての情報が正しく登録できてるとき' do
      expect(@user).to be_valid
      end

    end
  
    context 'ユーザー登録ができないとき' do
      it 'ニックネームが空のとき' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'Emailが空のとき' do 
        @user.email = nil 
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空のとき' do 
        @user.password = nil 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは確認用含めて2回入力しなければ登録できないこと' do 
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
    end
  
  
  end

end
