class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :event_registrations
  mount_uploader :avatar, AvatarUploader
  validates :user_id, presence: true
end
