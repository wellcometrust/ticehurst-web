class CreateAdmissionCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :admission_certificates do |t|
      t.integer :stay_id, null: false
      t.string :record_id, null: false
      t.integer :sequence_start, null: false
      t.integer :sequence_end, null: false
    end

    add_foreign_key :admission_certificates, :stays, on_delete: :cascade
    add_foreign_key :admission_certificates, :records, on_delete: :cascade

  end
end
