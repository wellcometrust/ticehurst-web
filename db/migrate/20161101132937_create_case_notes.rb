class CreateCaseNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :case_notes do |t|
      t.integer :stay_id, null: false
      t.string :record_id, null: false
      t.integer :sequence_start, null: false
      t.integer :sequence_end, null: false
    end

    add_foreign_key :case_notes, :stays, on_delete: :cascade
    add_foreign_key :case_notes, :records, on_delete: :cascade

  end
end
