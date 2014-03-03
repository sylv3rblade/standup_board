class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true

  def apply_omniauth(omniauth)
  	if email.blank?
      self.email = omniauth['info']['email'] 
      self.password = SecureRandom.hex(8) # we cant let password blank.
      self.password_confirmation = self.password
	end
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

end