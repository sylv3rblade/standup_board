class Authentication < ActiveRecord::Base
  belongs_to :user

  attr_accessor :uid, :provider, :access_token, :access_secret


end
