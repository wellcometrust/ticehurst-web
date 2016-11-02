class AddDatesToStays < ActiveRecord::Migration[5.0]
  def change
    add_column :stays, :admission, :date
    add_column :stays, :discharge, :date
  end
end
