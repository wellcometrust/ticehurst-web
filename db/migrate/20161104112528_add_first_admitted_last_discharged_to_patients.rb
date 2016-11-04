class AddFirstAdmittedLastDischargedToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :first_admitted, :date
    add_column :patients, :last_discharged, :date
  end
end
