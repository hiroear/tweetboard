class Tweets::MinesController < ApplicationController
  def index
    @tweets = current_user.tweets.order(created_at: :desc).page(params[:page]).per(15)
  end
end