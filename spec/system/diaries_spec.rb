require 'rails_helper'

RSpec.describe '投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @diary_image = Faker::Lorem.sentence
    @diary_country = 'New Zealand'
    @diary_city = Faker::Lorem.sentence
    @diary_category = Faker::Lorem.sentence
    @diary_date = '2020/01/01'
    @diary_recommendations = Faker::Lorem.sentence
  end
  context '投稿が出来るとき' do
    it 'ログインしたユーザーは新規登録出来る' do
      #ログインする
      visit new_user_session_path
      fill_in 'Email', with: @user.email 
      fill_in 'Password', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      #新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('旅行の思い出を投稿する')
      #新規投稿ページに移動する
      visit new_diary_path
      #フォームに情報を入力する
      attach_file 'diary-image', "public/images/test_image.png"
      select 'New Zealand', from:'diary-country'
      fill_in 'diary-city', with: @diary_city
      select 'things to see', from: 'diary-category'
      fill_in 'diary-date', with: @diary_date
      fill_in 'diary-recommendations', with: @diary_recommendations
      #投稿ボタンを押すとDiaryモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click   
      }.to change { Diary.count }.by(1)
      #トップページに遷移する
      expect(current_path).to eq root_path
      #トップページには先ほど投稿した内容が存在する(画像)
      expect(page).to have_selector ("img[src$='test_image.png']")
      #トップページには先ほど投稿した内容が存在する(テキスト)
      expect(page).to have_content("New Zealand")
      expect(page).to have_content(@diary_city)
      expect(page).to have_content("things to see")
    end
  end

  context '投稿が出来ないとき' do
    it 'ログインしていないユーザーは新規投稿出来ない' do
      #トップページに遷移する
      visit root_path
      #新規投稿をクリックする
      click_link '旅行の思い出を投稿する'
      #ログインページに遷移する
      expect(current_path).to eq new_user_session_path
    end
  end

  
end
