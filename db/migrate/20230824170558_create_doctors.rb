class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.string :experience_years
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
