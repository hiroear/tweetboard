class LikesController < ApplicationController
  before_action :set_tweet, only: %i[ create destroy ]

  def create
    @like = current_user.likes.build(tweet: @tweet)
    @like.save
    redirect_to tweets_path
  end

  def destroy
    @like = current_user.likes.find_by(tweet: @tweet)
    @like.destroy
    redirect_to tweets_path
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:tweet_id])
    end
end
