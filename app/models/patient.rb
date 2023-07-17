class Patient < ApplicationRecord
  validates :first_name, :last_name, :pesel, :city, :date_of_birth, :sex, presence: true
  validates :pesel, uniqueness: true
  validates :pesel, length: { is: 11 }
  validates :pesel, format: { with: /\A[0-9]+\z/, message: "only allows numbers" }
  validates :first_name, :last_name, :city, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :city, length: { minimum: 3 }
  validates :date_of_birth, date: { before: Proc.new { Time.now } }
  validates :sex, inclusion: { in: %w(M K) }

  has_many :appointments, dependent: :destroy
  has_many :physicians, through: :appointments
end
