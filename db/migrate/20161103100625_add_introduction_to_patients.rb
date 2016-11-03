class AddIntroductionToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :introduction, :text
  end
end
