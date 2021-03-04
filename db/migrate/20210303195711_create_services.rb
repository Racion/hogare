class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :service_description, null: false, default: ''
      t.date :service_date, null: false
      t.integer :price, null: false, default: 60000
      t.string :service_status, null: false, default: 'Created'
      t.references :order_id, null: false, foreign_key: true
      t.references :employee_id, null: false, foreign_key: true
      t.references :client_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
