class AddApprovalToBrand < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :approval, :boolean, null: false, default: false
  end
end
