class Dog < ActiveRecord::Base
  belongs_to :user
  mount_uploader :avatar, AvatarUploader
  validates :user_id, presence: true
  validates :dname,
            :length => { :within => 2..50 },
            :presence => true
  validate :picture_size
  validates :breed, length: { in: 2..50 }
  validates :weight, length: { maximum: 25 }
  validates :height, length: { maximum: 25 }
  validates :dcomments, length: { maximum: 500 }
  validates :health, length: { maximum: 50 }

  # This is not working
  #todo make this callable from the view at _form.
  def dog_owner
    "#{user_id} #{dname} #{breed}"
  end

  # do not allow pictures greater than 5 Mb.
  def picture_size
    if avatar.size > 5.megabytes
      errors.add(:picture, "Picture should not be greater than 5 MB")
    end
  end

end
