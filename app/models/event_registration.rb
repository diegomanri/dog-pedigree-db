class EventRegistration < ActiveRecord::Base
  belongs_to :event
  belongs_to :dog
end