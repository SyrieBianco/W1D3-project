class User < ActiveRecord::Base
  validates :username, :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  before_validation :ensure_session_token!

  attr_reader :password

  has_many :links,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Link

  has_many :comments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Comment

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

 def reset_session_token!
   self.session_token = SecureRandom.urlsafe_base64
   self.save
   self.session_token
 end

 def self.find_by_credentials(username, password)
   user = User.find_by_username(username)
  return nil if user.nil?
  user.is_password?(password) ? user : nil
 end



private

  def ensure_session_token!
    self.session_token ||= SecureRandom.urlsafe_base64
  end


end
