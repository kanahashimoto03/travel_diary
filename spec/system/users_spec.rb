require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録が出来るとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      #トップページに移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'Nickname', with: @user.nickname
      fill_in 'Email', with: @user.email 
      fill_in 'Password', with: @user.password 
      fill_in 'Password confirmation', with: @user.password_confirmation
      #サインアップボタンを押すとユーザーモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      #トップページへ遷移する
      expect(current_path).to eq root_path
      #トップページにマイページへ遷移するボタンとログアウトボタンがあることを確認する
      expect(page).to have_content('マイページ')
      expect(page).to have_content('ログアウト')
      #サインアップページへ遷移するボタンやログインページへ遷移するボタンがないことを確認する 
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン') 
    end
  end
  
  context 'ユーザー新規登録が出来ないとき' do 
    it '間違った情報ではユーザー新規登録が出来ずに登録ページに戻ってくる' do
      #トップページに移動する
      visit root_path
      #トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'Nickname', with: ""
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      fill_in 'Password confirmation', with: ""
      #サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      #新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインが出来るとき' do
    it '保存されているユーザーの情報と合致すればログインが出来る' do
      #トップページに移動する
      visit root_path
      #トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      #ログインページへ遷移する
      visit new_user_session_path
      #正しいユーザー情報を入力する
      fill_in 'Email', with: @user.email 
      fill_in 'Password', with: @user.password
      #ログインボタンを押す
      find('input[name="commit"]').click
      #トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      #トップページにマイページへ遷移するボタンとログアウトボタンがあることを確認する
      expect(page).to have_content('マイページ')
      expect(page).to have_content('ログアウト')
      #サインアップページへ遷移するボタンやログインページへ遷移するボタンがないことを確認する 
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ログインが出来ないとき' do
    it '保存されているユーザーの情報と合致しないとログインが出来ない' do
      #トップページに移動する
      visit root_path
      #トップページにログインページへ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      #ログインページへ遷移する
      visit new_user_session_path
      #ユーザー情報を入力する
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      #ログインボタンを押す
      find('input[name="commit"]').click
      #ログインページへ戻されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end