class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient

  validates :date, :time, presence: true
  ##TODO: change date and time to datetime
  validates :date, comparison: { greater_than_or_equal_to: Date.today }
  #validates :time, format: { with: /\A[0-9]{2}:[0-9]{2}\z/, message: "only allows HH:MM format" }
  validates :time, comparison: { greater_than_or_equal_to: "08:00", less_than_or_equal_to: "15:40" }
  validate :appointment_uniqueness
  validate :appointment_time
  validate :appointment_date_not_on_weekend

  private

  def appointment_uniqueness
    if Appointment.where(date: date, time: time, physician_id: physician_id).any?
      errors.add(:base, "Appointment already exists")
    end
  end

  def appointment_time
    if Appointment.where(date: date, time: (time - 20.minutes)..(time + 20.minutes), physician_id: physician_id).any?
      errors.add(:base, "Appointment overlaps with existing appointment with this physician")
    end
  end

  def appointment_date_not_on_weekend
    if date.saturday? || date.sunday?
      errors.add(:base, "Appointment cannot be on weekend")
    end
  end
end
