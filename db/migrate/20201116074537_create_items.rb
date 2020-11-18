class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product,          null: false
      t.text :explanation,        null: false
      t.integer :category_id,     null: false
      t.integer :condition_id,    null: false
      t.integer :shipping_fee_id, null: false
      t.integer :sender_id,       null: false
      t.integer :days_to_ship_id, null: false
      t.integer :price,           null: false
      t.references :user,         foreign_key: true

      t.timestamps
    end
  end
end
