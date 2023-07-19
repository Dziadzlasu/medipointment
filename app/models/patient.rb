class Patient < ApplicationRecord
  validates :first_name, :last_name, :pesel, :city, :date_of_birth, :sex, presence: true
  validates :pesel, uniqueness: { case_sensitive: false }
  validates :pesel, length: { is: 11 }
  validates :pesel, format: { with: /\A[0-9]+\z/, message: "only allows numbers" }
  #validates :first_name, :last_name, :city, format: { with: /\A[\pL\pM\p{Zs}.-]+\z/u, message: "only allows letters" }
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :city, length: { minimum: 3 }
  validates :date_of_birth, comparison: { greater_than: 120.years.ago, less_than_or_equal: Date.today }
  validates :sex, inclusion: { in: %w(M K) }

  has_many :appointments, dependent: :destroy
  has_many :physicians, through: :appointments

  def full_name
    "#{first_name} #{last_name}"
  end
end
