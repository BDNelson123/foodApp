class User < ActiveRecord::Base
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable

  before_save :ensure_token_authenticatable

  def ensure_token_authenticatable
    if token_authenticatable.blank?
      self.token_authenticatable = generate_token_authenticatable
    end
  end
  
  def generate_token_authenticatable
    loop do
      token = Devise.friendly_token
      break token unless User.where(token_authenticatable: token).first
    end
  end
end
