require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿機能' do

    context 'シナリオ投稿できる場合' do
      it 'コメントが入力できていれば投稿できる' do
        expect(@comment).to be_valid
      end 
    end

    context 'コメント投稿できない場合' do
      it 'commentが空では投稿できない' do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("評価コメントを入力してください")
      end
      it 'postが紐づいていないと投稿できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("シナリオを入力してください")
      end
      it 'userが紐づいていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("ログイン情報を入力してください")
      end
    end
  end
end
