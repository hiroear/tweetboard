class Tweets::MylikesController < ApplicationController
  def index
    @tweets = Tweet.where(id: current_user.likes.map(&:tweet_id)).order(created_at: :desc).page(params[:page]).per(15)
  end
end