class User < ApplicationRecord
<<<<<<< b0498fc4fdc88a8bd2ee3aba5617c3bf53765a00
  has_many :work_experiences, dependent: :destroy
  attr_accessor :remember_token
=======
  attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  before_create :create_activation_digest
>>>>>>> Log in
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :votes, as: :voteable 

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username,  presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :fullname, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  enum role: [:manager, :member]
  has_secure_password

  # scope :login_scope, ->(a) {where("username = :a OR email = :a", a: "karam112")}
  def User.digest(string)
    if (ActiveModel::SecurePassword.min_cost)
      cost = BCrypt::Engine::MIN_COST
    else
      cost = BCrypt::Engine.cost
    end
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  def send_activated_email
    UserMailer.account_activation(self).deliver_now
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end

  private
    def downcase_email
      self.email = email.downcase
    end

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
