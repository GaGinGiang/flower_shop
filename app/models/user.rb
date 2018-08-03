class User < ApplicationRecord
  enum sex: {male: 1, female: 2, trans: 3}
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
          ex]
      end
    end
  end

  private

  def email_downcase
    self.email = email.downcase
  end
end
