class AddVolumeNumberToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :volume_number, :integer
  end
end
