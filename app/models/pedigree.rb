class Pedigree < ActiveRecord::Base
  belongs_to :dog
  belongs_to :relative, class_name: Dog
end
