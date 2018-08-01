class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}, presence: true,
     uniqueness: {case_sensitive: false},
     length: {maximum: Settings.users.email.max_length}
  validates :password, presence: true,
    length: {minimum: Settings.users.password.min_length}
  validates :username, presence: true,
    length: {maximum: Settings.users.username.max_length}
  validates :name, presence: true,
    length: {maximum: Settings.users.name.max_length}

  before_save :email_downcase

  has_secure_password

  private

  def email_downcase
    self.email = email.downcase
  end
end
