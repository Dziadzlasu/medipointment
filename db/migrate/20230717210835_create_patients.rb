class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name, null: false, limit: 50
      t.string :last_name, null: false, limit: 50
      t.string :pesel, null: false, limit: 11
      t.string :city, null: false, limit: 50
      t.date :date_of_birth, null: false
      t.string :sex, null: false, limit: 1
      t.timestamps
    end
  end
end
