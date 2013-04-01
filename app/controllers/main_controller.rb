class MainController < ApplicationController
  def home
		@this_weekplans = Weekplan.thisweek
  end

  def facebook
  end
end
