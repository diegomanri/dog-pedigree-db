class Pedigree < ActiveRecord::Base
  belongs_to :dog
  belongs_to :relative, class_name: Dog

  validates_uniqueness_of :dog_id, :scope => :relative_id
end
