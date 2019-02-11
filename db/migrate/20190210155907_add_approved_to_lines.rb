class AddApprovedToLines < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :approved, :boolean, null: false, default: false
  end
end
