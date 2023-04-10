class AddTypeToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :devizna, :boolean, default: false
  end
end
