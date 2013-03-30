class Weekplan < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :progress_rate, :public_friends, :public_all, :todos_attributes

  # user and weekplan model
  belongs_to :user

  # weekpaln and Todo model
  has_many :todos, :dependent => :destroy
  # nested form
  accepts_nested_attributes_for :todos, allow_destroy: true

end
