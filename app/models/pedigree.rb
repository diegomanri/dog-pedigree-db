class Pedigree < ActiveRecord::Base
  belongs_to :dog
  belongs_to :relative, class_name: Dog

  #Prevents for equal dog relationships to be added more than once
  validates :dog_id, uniqueness: {scope: :relative_id}

  #Prevents for a dog to make a relationship with itself
  validates :relative_id, exclusion: {in: -> (u){[u.dog_id]}}
end
