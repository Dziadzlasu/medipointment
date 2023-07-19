require 'csv'

namespace :import do
  desc "Import patients from CSV file"
  task :patients => :environment do
    file = File.open("lib/datafiles/fake_medical_patients.csv")
    CSV.foreach(file, headers: true) do |row|
      pesel = PeselDecoder.new(row["pesel"])
      patient_data = row.to_hash.merge(date_of_birth: pesel.date_of_birth, sex: pesel.sex)
      Patient.create!(patient_data)
    end
  end
end
