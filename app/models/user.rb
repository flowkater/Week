class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  # user and weekplans model
  has_many :weekplans

  def facebook
    @facebook ||= Koala::Facebook::API.new(token)
  end

  def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.name = auth.info.name
        user.email = auth.info.email
        user.provider = auth.provider
        user.uid = auth.uid
        user.token = auth.credentials.token
        user.auth_expires_at = Time.at(auth.credentials.expires_at)
      end
  end

  def self.new_with_session(params, session)
      if session["devise.user_attributes"]
        new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  #devise제공 password. provider존재할 경우 password없어도 됨.
  def password_required?
      super && provider.blank?
  end

  #edit profile할 때 current_password 있는지 체크하는 부분.
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
        super
    end
  end
end
