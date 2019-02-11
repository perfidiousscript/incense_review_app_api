class AddApprovedToLines < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :approved, :boolean, default: false, null: false
  end
end
