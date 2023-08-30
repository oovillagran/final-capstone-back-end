class CreateSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :specialties do |t|
      t.string :type
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
