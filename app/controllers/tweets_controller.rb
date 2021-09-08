class TweetsController < ApplicationController
  def index
		@tweet = Tweet.new
		@room = Room.find(params[:room_id])
		@tweets = @room.tweets.includes(:user)
  end

	def create
		@room = Room.find(params[:room_id])
		@tweet = @room.tweets.new(tweet_params)
		if @tweet.save
			redirect_to room_tweets_path(@room)
		else
			@tweets = @room.tweets.includes(:user)
			render :index
		end
	end

	private

	def tweet_params
		params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
	end
end
