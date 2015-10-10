class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :event_registrations
  #require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader
end
