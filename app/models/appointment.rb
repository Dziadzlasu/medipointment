class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient

  validates :start_time, :price, presence: true
  validates :start_time, comparison: { greater_than_or_equal_to: Time.zone.today }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validate :appointment_uniqueness
  validate :appointment_time
  validate :appointment_date_not_on_weekend
  validate :appointment_in_working_hours

  private

  def appointment_uniqueness
    return unless start_time
    return unless Appointment.where(start_time: start_time, physician_id: physician_id).any?
    errors.add(:base, "Appointment already exists")
  end

  def appointment_time
    return unless start_time
    if Appointment.where(start_time:   (start_time - 19.minutes)..(start_time + 19.minutes),
                         physician_id: physician_id).any?
      errors.add(:base, "Appointment overlaps with existing appointment with this physician")
    end
  end

  def appointment_in_working_hours
    return unless start_time
    return unless start_time.to_fs(:time) < "08:00" || start_time.to_fs(:time) > "15:40"
    errors.add(:base, "Appointment must be between 08:00 and 15:40")
  end

  def appointment_date_not_on_weekend
    return unless start_time
    return unless start_time.saturday? || start_time.sunday?
    errors.add(:base, "Appointment cannot be on weekend")
  end
end
