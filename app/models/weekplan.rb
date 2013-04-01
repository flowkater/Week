class Weekplan < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :progress_rate, :public_friends, :public_all, :todos_attributes

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

end
