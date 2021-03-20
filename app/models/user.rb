class User < ApplicationRecord
  validates :first_name, presence: true, length:{maximum: 19}
  validates :last_name, presence: true
  validates :email, presence: true, length: {maximum: 254}
  validates :password, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, format: { with: VALID_EMAIL_REGEX}


  def name
    [first_name, last_name].join(' ')
  end

end
