class User < ApplicationRecord
  attr_accessor :remember_token
  enum sex: {male: 1, female: 2, other: 3}
  has_many :bills

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
  validates :address, presence: true,
    length: {maximum: Settings.users.address.max_length}
  validates :sex, presence: true, inclusion: {in: sexes.keys}

  before_save :email_downcase
  has_secure_password

  class << self
    def sex_attributes_for_select
      sexes.map do |sex, _|
        [I18n.t("activerecord.attributes.#{model_name.i18n_key}.sexes.#{sex}"),
          sex]
      end
    end

    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  private

  def email_downcase
    self.email = email.downcase
  end
end
