class Event < ApplicationRecord
  validates_presence_of :name, :date, :location, :description

  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :enrollments
  has_many :attendees, through: :enrollments, source: :user
end
