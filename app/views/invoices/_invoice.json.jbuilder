json.extract! invoice, :id, :number, :fiscal_year, :total_amount, :service, :customer, :vehicle, :date, :due_date, :extra_notes, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
