class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_description, null: false, default: ''
      t.string :address, null: false, default: ''
      t.string :address_complement, default: ''
      t.integer :phone, null: false, default: 0000000
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
