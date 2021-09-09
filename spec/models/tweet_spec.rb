require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの投稿' do
    context 'ツイートが投稿できる場合' do
      it 'textとimageが存在していれば保存できる' do
        expect(@tweet).to be_valid
      end
      it 'textが空でも保存できる' do
        @tweet.text = ''
        expect(@tweet).to be_valid
      end
      it 'imageが空でも保存できる' do
        @tweet.image = nil
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'textとimageが空では保存できない' do
        @tweet.text = ''
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end
      it 'roomが紐付いていないと保存できない' do
        @tweet.room = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Room must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
