class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.integer :country_id,     null: false
      t.string :city,            null: false
      t.integer :category_id,    null: false 
      t.date :date,              null: false 
      t.text :recommendations,   null: false
      t.text :things_to_avoide
      t.text :things_to_bring
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
