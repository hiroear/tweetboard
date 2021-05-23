class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ edit update destroy ]

  #GET /tweets  prefix:tweets
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  #POST /tweets  prefix:tweets
  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was successfully created."
    else
      render :index, status: :unprocessable_entity
    end
  end

  #GET /tweets/id/edit  prefix:edit_tweet
  def edit
  end

  #PATCH or PUT  /tweets/id  prefix:tweet
  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Tweet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #DELETE  /tweets/id  prefix:tweet
  def destroy
    @tweet.destroy
    redirect_to tweets_path, "Tweet was successfully destroyed."
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
