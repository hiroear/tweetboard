class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ edit update destroy ]

  #GET /tweets  prefix:tweets
  def index
    @tweets = Tweet.order(created_at: :desc).page(params[:page]).per(15)
    @tweet = Tweet.new
  end

  #POST /tweets  prefix:tweets
  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to tweets_path
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
      redirect_to request.referer, notice: 'ツイートが編集されました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #DELETE  /tweets/id  prefix:tweet
  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
