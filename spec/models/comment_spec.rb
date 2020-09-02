require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

    describe 'コメント投稿' do
      
      context 'コメントが投稿出来るとき' do 
        it 'コメントが記載されているとき' do
          expect(@comment).to be_valid
        end
      end  

      context 'コメントが投稿できないとき' do
        it 'コメントが投稿されていないとき' do
          @comment.comment = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Comment can't be blank")
        end
      end

    end
end
