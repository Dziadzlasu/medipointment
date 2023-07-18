FactoryBot.define do
  factory :appointment do
    patient
    physician
    date { Date.today + 1.day }
    time { "10:00" }
  end
end
