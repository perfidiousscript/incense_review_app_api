class AddApprovedToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :approved, :boolean, null: false, default: false
  end
end
