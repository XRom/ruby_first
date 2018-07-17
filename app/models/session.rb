class Session
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :password, presence: true
  validates :email, presence: true
  validate :user_password_is_correct

  def user_password_is_correct
    if user.blank?
      errors.add(:email, "user not found")
      return
    end

    unless user.authenticate(password)
      errors.add(:password, "password incorrect")
    end
  end

  def user
    User.find_by(email: email)
  end
end