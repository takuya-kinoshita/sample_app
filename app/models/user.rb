class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password
  before_save {self.email = email.downcase}
  validates :first_name, presence: true, length:{maximum: 19}
  validates :last_name, presence: true
  validates :email, presence: true, length: {maximum: 254}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, format: { with: VALID_EMAIL_REGEX}
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true, length: { minimum: 6}


  def name
    [first_name, last_name].join(' ')
  end

  def User.digest(string)
    BCrypt::Password.create(string)
  end


  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end




end
