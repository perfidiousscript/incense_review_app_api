class RemoveBrandFromIncenses < ActiveRecord::Migration[5.2]
  def change
    remove_column :incenses, :brand_id
  end
end
