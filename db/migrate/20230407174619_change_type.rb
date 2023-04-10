class ChangeType < ActiveRecord::Migration[7.0]
  def change
    change_column :invoices, :service, :string
    change_column :invoices, :customer, :string
  end
end
