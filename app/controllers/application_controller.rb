class ApplicationController < ActionController::Base
	include PublicActivity::StoreController
  protect_from_forgery

  def user_session_check
    unless user_signed_in?
      redirect_to root_path, :notice => "Please Login"
    end
  end

  def after_sign_in_path_for(resource)
	 admin_pages_path
	end
  
end
