class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.references :user, null: false, foreign_key: true
      t.date :contract_start, null: false
      t.date :contract_end

      t.timestamps
    end
  end
end
