class AllowNullsInCaseBookRecords < ActiveRecord::Migration[5.0]
  def change
    change_column_null :case_notes, :sequence_start, true
    change_column_null :case_notes, :sequence_end, true
  end
end
