module MainHelper
	def thisWeekPeople
		# Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400, time = Time.now
		# Weekplan.first.created_at.day - Weekplan.first.created_at.wday
		time = Time.now
		thisWeekSunday = (Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400)
		thisWeekSaturday = thisWeekSunday + 6.days + 86399

		Weekplan.find(:all, :conditions => ["created_at >= ? AND created_at <= ?", thisWeekSunday, thisWeekSaturday])
	end
end
