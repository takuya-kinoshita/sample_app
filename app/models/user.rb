class User < ApplicationRecord
  has_secure_password
  before_save {self.email = email.downcase}
  validates :first_name, presence: true, length:{maximum: 19}
  validates :email, presence: true, length: {maximum: 254}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, format: { with: VALID_EMAIL_REGEX}
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true
  validates :password_confirmation, presence: true, length: { minimum: 6}


  def name
    [first_name, last_name].join(' ')
  end

end
