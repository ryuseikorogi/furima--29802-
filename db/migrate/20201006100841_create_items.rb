class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
        ## Database authenticatable
        t.references :user, foreign_key: true
        t.string :item_name,                null: false
        t.string :shipping_prefecture_id, null: false
        t.string :days_to_ship_id,        null: false
        t.string :condition_id,           null: false
        t.string :shipping_burden_id,     null: false
        t.string :genre_id,              null: false
        t.string :text,              null: false
        t.integer :price,              null: false
      t.timestamps
    end
  end
end