class CreateStays < ActiveRecord::Migration[5.0]
  def change
    create_table :stays do |t|
      t.integer :patient_id, null: false
      t.text :transcribed_name, null: false
      t.integer :transcribed_page, null: false
      t.integer :transcribed_line, null: false
      t.text :transcribed_archives_ref
      t.text :transcribed_date_of_admission
      t.text :transcribed_date_of_discharge
      t.text :transcribed_subsequent_condition
    end

    add_foreign_key :stays, :patients, on_delete: :cascade
  end
end
