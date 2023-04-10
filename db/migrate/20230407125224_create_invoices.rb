class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.integer :number
      t.integer :fiscal_year
      t.integer :total_amount
      t.text :service
      t.text :customer
      t.string :vehicle
      t.date :date
      t.date :due_date
      t.text :extra_notes

      t.timestamps
    end
  end
end
