class RenameColumnTypeInSpecialties < ActiveRecord::Migration[7.0]
  def change
    rename_column :specialties, :type, :name
  end
end
