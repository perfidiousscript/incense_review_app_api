class AddApprovedToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :approved, :boolean, default: false, null: false
  end
end
