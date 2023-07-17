class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient

  validates :date, :time, presence: true
  validates :date, date: { after: Proc.new { Time.now } }
  validates :time, format: { with: /\A[0-9]{2}:[0-9]{2}\z/, message: "only allows HH:MM format" }
  validates :time, time: { after: Proc.new { Time.now } }
  validate :appointment_uniqueness
  validate :appointment_time

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
end
