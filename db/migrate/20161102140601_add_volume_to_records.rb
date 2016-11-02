class AddVolumeToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :volume, :text
  end
end
