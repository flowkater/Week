class Weekplan < ActiveRecord::Base
  # attr_accessible :title, :body

  # user and weekplan model
  belongs_to :user

  # weekpaln and Todo model
  has_many :todos
end
