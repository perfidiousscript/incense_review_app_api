class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :name, null: false
      t.references :brand, index: true, foreign_key: true
    end
  end
end
