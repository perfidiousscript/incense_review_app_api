class AddEarthyToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :earthy, :integer, null:false
  end
end
