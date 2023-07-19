FactoryBot.define do
  factory :appointment do
    patient
    physician
    price { 234.56 }
    start_time { DateTime.now.beginning_of_day + 1.day + 10.hours }
  end
end
