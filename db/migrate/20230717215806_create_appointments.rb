class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time, null: false
      t.decimal :price, precision: 6, scale: 2, null: false
      t.references :physician, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.timestamps
    end
  end
end
