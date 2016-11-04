class AddLengthOfStaysToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :length_of_stays, :integer
  end
end
