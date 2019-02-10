class CreateIncenses < ActiveRecord::Migration[5.2]
  def change
    create_table :incenses do |t|
      t.string :name, null: false
      t.references :brand, index: true, foreign_key: true
      t.references :line, index: true, foreign_key: true
    end
  end
end
