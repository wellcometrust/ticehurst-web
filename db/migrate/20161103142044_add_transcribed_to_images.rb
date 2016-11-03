class AddTranscribedToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :transcribed, :boolean, null: false, default: false
  end
end
