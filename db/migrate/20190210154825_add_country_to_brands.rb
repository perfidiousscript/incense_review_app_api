class AddCountryToBrands < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :country, :string
  end
end
