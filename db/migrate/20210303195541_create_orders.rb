class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_status, null: false, default: 'Created' 
      t.integer :order_total_value
      t.references :client_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
