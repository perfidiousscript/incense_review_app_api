class AddDescriptionToLines < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :description, :text
  end
end
