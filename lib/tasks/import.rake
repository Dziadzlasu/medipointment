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

  task :physicians, [:arg] => :environment do |t, args|
    number_of_doctors = args[:arg].to_i || 30
    SPECIALIZATIONS = [
      'Alergolog',
      'Chirurg',
      'Dermatolog - Wenerolog',
      'Diabetolog',
      'Endokrynolog',
      'Gastroenterolog',
      'Ginekolog',
      'Hematolog',
      'Kardiolog',
      'Internista',
      'Neurolog',
      'Okulista',
      'Onkolog',
      'Ortopeda',
      'Pulmonolog',
      'Psychiatra',
      'Reumatolog'
    ]

    number_of_doctors.times do
      physician_attributes = {
        first_name: FFaker::NamePL.first_name,
        last_name: FFaker::NamePL.last_name,
        specialization: SPECIALIZATIONS.sample
      }
      puts "Creating physician: #{physician_attributes[:first_name]} #{physician_attributes[:last_name]} #{physician_attributes[:specialization]}"
      Physician.create!(physician_attributes)
    end
  end
end
