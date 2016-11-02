class AddPageInfoToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :left_page, :text
    add_column :images, :right_page, :text
    add_column :images, :page_type, :text
  end
end
