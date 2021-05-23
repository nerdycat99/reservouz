class Policy < ApplicationRecord
  belongs_to :venue

  validates :concurrent_bookings, presence: true
  validates :duration_allowed, presence: true

  attr_accessor :monday_start_a, :monday_end_a, :monday_start_b, :monday_end_b, :monday_start_c, :monday_end_c
  attr_accessor :tuesday_start_a, :tuesday_end_a, :tuesday_start_b, :tuesday_end_b, :tuesday_start_c, :tuesday_end_c
  attr_accessor :wednesday_start_a, :wednesday_end_a, :wednesday_start_b, :wednesday_end_b, :wednesday_start_c, :wednesday_end_c
  attr_accessor :thursday_start_a, :thursday_end_a, :thursday_start_b, :thursday_end_b, :thursday_start_c, :thursday_end_c
  attr_accessor :friday_start_a, :friday_end_a, :friday_start_b, :friday_end_b, :friday_start_c, :friday_end_c
  attr_accessor :saturday_start_a, :saturday_end_a, :saturday_start_b, :saturday_end_b, :saturday_start_c, :saturday_end_c
  attr_accessor :sunday_start_a, :sunday_end_a, :sunday_start_b, :sunday_end_b, :sunday_start_c, :sunday_end_c

  def self.build_time_array(start_a, end_a, start_b, end_b, start_c, end_c)
    day = []
    range = []
    range << start_a
    range << end_a
    day << range
    range = []
    range << start_b
    range << end_b
    day << range
    range = []
    range << start_c
    range << end_c
    day << range
    return day
  end
end
