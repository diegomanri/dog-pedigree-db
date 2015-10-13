class User < ActiveRecord::Base
  has_many :dogs, dependent: :destroy
  attr_accessor :reset_token
  has_secure_password
  before_create :confirmation_token
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :username,
            :length => { :within => 4..25 },
            :uniqueness => true,
            :presence => true
  validates :uemail,
            :presence => true,
            :uniqueness => true,
            :format => EMAIL_REGEX

  validates :password,
            :presence => true,
            :length => { :minimum => 8 }
  validates_confirmation_of :password

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  # Sets the password reset attributes
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_set_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired
  def password_reset_expired?
    reset_set_at < 2.hours.ago
  end

  # Generates token for password reset functionality
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  # Converts email to all lower-case
  def downcase_email
    self.email = email.downcase
  end

end
