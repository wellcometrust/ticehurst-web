class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.text :name
      t.integer :stays_count, default: 0, null: false
    end
  end
end
