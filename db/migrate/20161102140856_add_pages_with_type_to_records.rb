class AddPagesWithTypeToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :pages_with_type, :integer, null: false, default: 0
  end
end
