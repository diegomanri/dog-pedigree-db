class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :event_registrations
  mount_uploader :avatar, AvatarUploader
  validates :user_id, presence: true
  validates :dname,
            :length => { :within => 2..50 },
            :presence => true
  # after_initialize :set_dog_user, :if => :new_record?

  # This approach didn't work because you can't call a controller method in a model.
  # def set_dog_user
  #   self.user_id = current_user.id
  # end

  # This is not working
  #todo make this callable from the view at _form.
  def dog_owner
    "#{user_id} #{dname} #{breed}"
  end

end
