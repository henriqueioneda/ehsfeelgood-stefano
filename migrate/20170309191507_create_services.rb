class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :service_type
      t.string :supplier_id
      t.string :supplier_name
      t.string :service_status
      t.string :service_price
      t.string :aditional_information

      t.timestamps
    end
  end
end
