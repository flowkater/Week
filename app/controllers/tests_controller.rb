class TestsController < ApplicationController
	# before_filter - controller action 전에 실행되는 메서드
	# Devise제공, user_signed_in?, current_user..등등 사용가능
	before_filter :authenticate_user!, :only => [:show]

  def show
  		@joined_friends = current_user.not_joined_friends

  end
end
