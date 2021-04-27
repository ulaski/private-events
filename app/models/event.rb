# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, :date, :location, :description, presence: true

  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :enrollments
  has_many :attendees, through: :enrollments, source: :user

  scope :past, -> { where('date < ?', Time.zone.today) }
  scope :upcoming, -> { where('date >= ?', Time.zone.today) }
end
