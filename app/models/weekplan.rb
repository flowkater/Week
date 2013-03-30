class Weekplan < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :progress_rate, :public_friends, :public_all

  # user and weekplan model
  belongs_to :user

  # weekpaln and Todo model
  has_many :todos
end
