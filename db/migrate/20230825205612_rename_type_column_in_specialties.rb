class RenameTypeColumnInSpecialties < ActiveRecord::Migration[7.0]
  def change
    rename_column :specialties, :type, :specialty_type
  end
end
