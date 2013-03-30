module MainHelper
	def ThisWeekPeople
		# Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400, time = Time.now
		time = Time.now
		thisWeek = Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400
		Weekplan.

	end
end
