# encoding : utf-8
class MainController < ApplicationController
  before_filter :user_session_check, :only => [:facebook]
  
  def home
		@this_weekplans = Weekplan.thisweek
  end

  def facebook
  		@joined_friends = current_user.joined_friends.page(params[:page]).per(5)

  end

  def user_session_check
  		unless user_signed_in?
  			redirect_to root_url, :notice => "로그인 후 이용해주세요."
  		end
  end


end
