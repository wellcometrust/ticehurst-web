class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images, id: false do |t|
      t.primary_key :id, :string
      t.string :record_id, null: false
      t.integer :height, null: false
      t.integer :width, null: false
    end

    add_foreign_key :images, :records, on_delete: :cascade
    add_index :images, :id, unique: true
  end
end
