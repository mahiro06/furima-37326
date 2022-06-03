class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_cord,        null: false
      t.integer     :prefecture_id,      null: false
      t.string      :city,               null: false
      t.string      :building_address,  null: false
      t.string      :building
      t.string      :tell,               null: false
      t.references  :rop,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
