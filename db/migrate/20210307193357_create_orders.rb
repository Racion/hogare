class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_status, null: false, default: 'Creada'
      t.integer :order_total_value, default: 0
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
