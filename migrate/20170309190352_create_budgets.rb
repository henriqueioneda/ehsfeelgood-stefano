class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.string :requested_service
      t.string :hirer_id
      t.string :hirer_name
      t.string :supplier_id
      t.string :supplier_name
      t.string :budget_status
      t.string :budget_price
      t.string :days_of_service
      t.string :aditional_information
      t.timestamps
    end
  end
end
