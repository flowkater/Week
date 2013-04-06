class MainController < ApplicationController
  def home
		@this_weekplans = Weekplan.thisweek
		# @friends = current_user.joined_friends
  end

  def facebook
  end
end
