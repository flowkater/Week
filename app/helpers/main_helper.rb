module MainHelper
	def ThisWeekPeople
		# Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400, time = Time.now
		# Weekplan.first.created_at.day - Weekplan.first.created_at.wday
		time = Time.now
		thisWeekSunday = (Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400)
		thisWeekSaturday = thisWeekSunday + 7.days + 86399



		

	end
end
