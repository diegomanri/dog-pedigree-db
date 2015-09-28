class User < ActiveRecord::Base
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

  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
