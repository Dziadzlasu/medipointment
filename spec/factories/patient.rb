FactoryBot.define do
  factory :patient do
    first_name {FFaker::NamePL.male_first_name }
    last_name { FFaker::NamePL.male_last_name }
    pesel { FFaker::IdentificationPL.pesel }
    city { FFaker::AddressPL.city }
    date_of_birth { FFaker::Time.between(120.years.ago, Date.today)}
    sex { "M" }
  end
end
