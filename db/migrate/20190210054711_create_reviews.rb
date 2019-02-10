class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name, null: false
      t.integer :sweet, null:false
      t.integer :sour, null:false
      t.integer :salty, null:false
      t.integer :bitter, null:false
      t.integer :umami, null:false
      t.integer :spice, null:false
      t.integer :woody, null:false
      t.integer :minutes, null:false
      t.string :season
      t.text :review_text
      t.references :incense, index: true, foreign_key: true
    end
  end
end
