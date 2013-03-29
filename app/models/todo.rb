class Todo < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title

  # Weekplan and Todo model
  belongs_to :weekplan
end
