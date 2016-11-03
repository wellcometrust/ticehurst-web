class AddIndexImageIdToCaseNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :case_notes, :index_image_id, :text
    add_column :case_notes, :index_side, :text
    add_column :case_notes, :patient_id, :integer

    change_column_null :case_notes, :stay_id, true

    add_foreign_key :case_notes, :patients, on_delete: :restrict
    add_foreign_key :case_notes, :images, column: :index_image_id, on_delete: :restrict
  end
end
