# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :enrollments
  has_many :attended_events, through: :enrollments, source: :event

  def full_name
    "#{first_name} #{last_name}"
  end
end
