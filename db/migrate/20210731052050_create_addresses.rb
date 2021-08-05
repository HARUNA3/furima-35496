class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :purchase        ,null: false, foreign_key: true
      t.string     :postal_code     ,null: false
      t.integer    :prefecture_id   ,null: false
      t.text       :city            ,null: false
      t.text       :address         ,null: false
      t.string     :building        ,null: false
      t.string     :phone_number    ,null: false
      t.timestamps
    end
  end
end
