class Weekplan < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :progress_rate, :public_friends, :public_all, :todos_attributes

  # user and weekplan model
  belongs_to :user

  # weekpaln and Todo model
  has_many :todos, :dependent => :destroy
  # nested form
  accepts_nested_attributes_for :todos, allow_destroy: true

  def self.thisweek
  	time = Time.now
		thisWeekSunday = (Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400)
		thisWeekSaturday = thisWeekSunday + 6.days + 86399

		self.find(:all, conditions: ["created_at >= ? AND created_at <= ?", thisWeekSunday, thisWeekSaturday], order: 'created_at DESC')
  end

  def self.has_one_week_plan?(current_user_id)
    currentuser_this_week(current_user_id)
  end

  def self.currentuser_this_week(current_user_id)
    time = Time.now
    thisWeekSunday = (Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400)
    thisWeekSaturday = thisWeekSunday + 6.days + 86399

    self.find(:all, conditions: ["created_at >= ? AND created_at <= ? AND user_id == ?", thisWeekSunday, thisWeekSaturday, current_user_id])
  end

end
