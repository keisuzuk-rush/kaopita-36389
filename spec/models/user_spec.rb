require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it 'name、email、passwordとpassword_confirmation、company_numberが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない時' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@を含まなければ登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordに全角が含まれているのでは登録できない' do
        @user.password = 'aaa０００'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = '000aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'company_numberが空では登録できない' do
        @user.company_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Company number can't be blank")
      end
      it 'company_numberが9文字以上では登録できない' do
        @user.company_number = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('Company number is invalid')
      end
      it 'company_numberが7文字以下では登録できない' do
        @user.company_number = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Company number is invalid')
      end
      it 'company_numberに全角が含まれているのでは登録できない' do
        @user.company_number = '１２３４５６７８'
        @user.valid?
        expect(@user.errors.full_messages).to include('Company number is invalid')
      end
    end
  end
end
