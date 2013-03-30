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

 ##Login

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

 ##Facebook Graph API
  
  #FB Graph API연결할 메서드
  def facebook
    @facebook ||= Koala::Facebook::API.new(token)
  end  

  # user의 친구 목록 가져오기
  #  [{"name"=>"won", "id"=>"1234567.."}, {"name"=>"bob", "id"=>"22224567.."}]의 형태
  def friends_info_list
     facebook.get_connections("me", "friends") 
  end

  # user의 친구중에 가입된 친구 리스트 => @signed_up_friends
  # user의 친구중에 가입 안된 친구 리스트 => @unsigned_up_friends
  #  [{"name"=>"jiwon"}, {"name"=>"jiwon"}]
  def signup_or_unsignup_friends
    @signed_up_friends = []
    @unsigned_up_friends = []

    friends_info_list.each do |friend_info|
      if User.find_by_uid(friend_info["id"])!=nil
        @signed_up_friends << friend_info 
      else
        @unsigned_up_friends << friend_info
      end
    end
  end

end
