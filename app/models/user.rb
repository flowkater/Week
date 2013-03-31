class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # user and weekplans model
  has_many :weekplans, :dependent => :destroy

  def thisWeekPeople
    # Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400, time = Time.now
    # Weekplan.first.created_at.day - Weekplan.first.created_at.wday
    time = Time.now
    thisWeekSunday = (Time.gm(time.year, time.month, time.day) - Time.now.wday * 86400)
    thisWeekSaturday = thisWeekSunday + 6.days + 86399

    Weekplan.find(:all, :conditions => ["created_at >= ? AND created_at <= ?", thisWeekSunday, thisWeekSaturday])
  end
end
