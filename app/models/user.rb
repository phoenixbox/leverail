class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  # Associations
  has_many :pre_qualifications
  has_many :vendors, :through => :pre_qualifications

  # Upvotes
  has_many :upvotes
  has_many :suggestions, :through => :upvotes

  has_many :favorites

  has_many :tags

  has_many :suggestions

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
