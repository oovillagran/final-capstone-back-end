class CreateClinics < ActiveRecord::Migration[7.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :city
      t.string :address
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
