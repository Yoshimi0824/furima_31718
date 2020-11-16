require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができるとき' do
      it '全ての入力項目を正しく入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができないとき' do
      it 'ニックネームが必須であること' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須であること' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'パスワードは、確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
        @user.password = '111aaa'
        @user.password_confirmation = '222bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名の名字が必須であること' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'ユーザー本名の名前が必須であること' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ユーザー本名の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'Doe'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end

      it 'ユーザー本名の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'John'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'ユーザー本名の名字のフリガナが必須であること' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'ユーザー本名の名前のフリガナが必須であること' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      
      it 'ユーザー本名の名字のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カナ文字を使用してください')
      end

      it 'ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.first_name_kana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カナ文字を使用してください')
      end

      it '生年月日が必須であること' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
