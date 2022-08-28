class Event < ApplicationRecord
  has_many :tickets, foreign_key: :attended_event_id
  has_many :attendees, through: :tickets #, source: :event_attendee
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
end
