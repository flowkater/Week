class MainController < ApplicationController
  def home
  	time = Time.now
		thisWeekSunday = (Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400)
		thisWeekSaturday = thisWeekSunday + 6.days + 86399

		@thisWeekPeople = Weekplan.find(:all, :conditions => ["created_at >= ? AND created_at <= ?", thisWeekSunday, thisWeekSaturday], :order => 'created_at DESC')
  end
end
