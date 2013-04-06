class Todo < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :todo_check, :category

  # Weekplan and Todo model
  belongs_to :weekplan
end
