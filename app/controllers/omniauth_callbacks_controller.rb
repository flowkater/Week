class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def facebook
		# raise request.env["omniauth.auth"].to_yaml
		auth = request.env["omniauth.auth"]
		user = User.from_omniauth(auth)
		if user.persisted? 
			flash.notice = "Signed in!"
      	sign_in_and_redirect user	
		else
			session["devise.user_attributes"] = user.attributes
			redirect_to new_user_registration_url
		end
	end	
end
