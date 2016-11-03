class AddTranscribedIndexPageRefToCaseNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :case_notes, :transcribed_index_page_ref, :text
  end
end
