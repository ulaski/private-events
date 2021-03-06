# frozen_string_literal: true

class Enrollment < ApplicationRecord
  enum status: { invited: 0, accepted: 1 }

  belongs_to :user
  belongs_to :event
end
