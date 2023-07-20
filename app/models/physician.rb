class Physician < ApplicationRecord
  validates :first_name, :last_name, :specialization, presence: true
  # validates :first_name, :last_name, format: { with: /\A[\pL\pM\p{Zs}.-]+\z/u, message: "only allows letters" }
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :specialization, length: { minimum: 3 }

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments

  def full_name
    "#{first_name} #{last_name}"
  end
end
