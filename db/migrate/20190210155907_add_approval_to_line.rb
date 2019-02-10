class AddApprovalToLine < ActiveRecord::Migration[5.2]
  def change
    add_column :lines, :approval, :boolean, null: false, default: false
  end
end
