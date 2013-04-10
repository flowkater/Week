# encoding : utf-8
class MainController < ApplicationController
  before_filter :user_session_check, :only => [:facebook]
  
  def home
		@this_weekplans = Weekplan.thisweek
    if signed_in?
      if current_user.weekplans.has_one_week_plan?(current_user)
        redirect_to weekplans_path
      else
        redirect_to new_weekplans_path
      end
    end
		# @friends = current_user.joined_friends
  end

  def facebook
  	@joined_friends = current_user.joined_friends.page(params[:page]).per(5)
  end

end
