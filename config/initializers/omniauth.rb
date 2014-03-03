Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, InDinero::FACEBOOK_KEY, InDinero::FACEBOOK_SECRET,
  			:scope => 'email,user_birthday', :display => 'popup'
  provider :linkedin, InDinero::LINKEDIN_KEY, InDinero::LINKEDIN_SECRET,
             :scope => "r_basicprofile r_emailaddress"
end