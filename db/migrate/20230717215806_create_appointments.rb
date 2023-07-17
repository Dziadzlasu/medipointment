class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.date :date, null: false
      t.time :time, null: false
      t.references :physician, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
