class Event < ActiveRecord::Base
  before_create :format_time
  belongs_to :creator, class_name: User
  has_many :event_registrations, foreign_key: :event_id, dependent: :destroy
  has_many :attendees, through: :event_registrations, source: :attendee, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  validate :event_date_check
  validate :event_time_check
  validates_presence_of :edescription
  validates_presence_of :ename

  default_scope -> {order('edate asc')}
  scope :upcoming_events, ->  { where('edate > ?', Date.today)}
  scope :past_events, -> { where('edate < ?', Date.today)}


  def self.search(search)
    where("ename LIKE ? OR estateprov LIKE ? OR ecity LIKE ? OR ecountry LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def format_time
    date = Date.today
    self.etime = self.etime.to_datetime.change(day: date.day, month: date.month, year: date.year).to_time
  end

  def event_date_check
    edate < Date.today ? errors.add(:edate, "Event date can't be in the past") : true if !edate.nil?
  end

  def event_time_check
    if edate == Date.today && !edate.nil? && !etime.nil?
      if etime.hour < Time.now.hour
        errors.add(:etime, "Event time can't be in the past")
      elsif etime.hour == Time.now.hour && etime.min > Time.now.min
        errors.add(:etime, "too soon to be organized")
      else
        true
      end
    end
  end

end