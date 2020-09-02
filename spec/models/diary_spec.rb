require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do 
    @diary = FactoryBot.build(:diary)
    @diary.image = fixture_file_upload('public/images/test_image.png')
  end
    
    describe '旅行投稿の保存' do
      context '投稿が保存出来るとき' do
        it '全ての情報が正しく入力できているとき' do 
        expect(@diary).to be_valid
        end
      end

      context '投稿が保存できないとき' do 
        it '画像が空のときは保存できないこと' do 
          @diary.image = nil
          @diary.valid?
          expect(@diary.errors.full_messages).to include("Image can't be blank")
        end

        it '国名が必要であること' do 
          @diary.country_id = nil 
          @diary.valid?
          expect(@diary.errors.full_messages).to include("Country Select")
        end

        it '都市名が必要であること' do
          @diary.city = nil 
          @diary.valid?
          expect(@diary.errors.full_messages).to include("City can't be blank")
        end

        it 'カテゴリーが必要であること' do
          @diary.category_id = nil
          @diary.valid?
          expect(@diary.errors.full_messages).to include("Category Select")
        end

        it '日付が必要であること' do 
          @diary.date = nil 
          @diary.valid?
          expect(@diary.errors.full_messages).to include("Date can't be blank")
        end

        it 'おすすめが必要であること' do 
          @diary.recommendations = nil 
          @diary.valid?
          expect(@diary.errors.full_messages).to include("Recommendations can't be blank")
        end
      end
    end
end
