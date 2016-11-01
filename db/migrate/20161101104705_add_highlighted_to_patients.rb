class AddHighlightedToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :highlighted, :boolean, null: false, default: false
  end
end
