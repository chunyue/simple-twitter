class TweetsController < ApplicationController
  def index
   # 基於測試規格，必須講定變數名稱，請用此變數中存放關注人數 Top 10 的使用者資料
   @tweet = Tweet.new
  end

  def create 
    @tweet = current_user.tweets.build(description_params)
    @tweet.save!
    redirect_to root_path
  end

  def like
  end

  def unlike
  end

  private

  def description_params
    params.require(:tweet).permit(:description)
    
  end

end
