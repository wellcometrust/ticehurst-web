class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records, id: false do |t|
      t.primary_key :id, :string, limit: 10
    end

    add_index :records, :id, unique: true
  end
end
