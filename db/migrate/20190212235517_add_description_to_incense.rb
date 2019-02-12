class AddDescriptionToIncense < ActiveRecord::Migration[5.2]
  def change
    add_column :incenses, :description, :text
  end
end
