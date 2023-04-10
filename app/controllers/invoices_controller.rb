class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[ show edit update destroy ]

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all.order("number DESC")
    @totals_mk = @invoices.where(devizna: false).sum(:total_amount)
    @totals_eur = @invoices.where(devizna: true).sum(:total_amount)
    @eur_to_mk = (@totals_eur * 61.5).to_i
    @total = @totals_mk + @eur_to_mk
  end

  # GET /invoices/1 or /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @customers = Invoice.pluck(:customer).uniq
    @services = Invoice.pluck(:service).uniq
    @vehicles = Invoice.pluck(:vehicle).uniq
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
    @customers = Invoice.pluck(:customer).uniq
    @services = Invoice.pluck(:service).uniq
    @vehicles = Invoice.pluck(:vehicle).uniq
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoice_url(@invoice), notice: "Invoice was successfully created." }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to invoice_url(@invoice), notice: "Invoice was successfully updated." }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Invoice was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:number, :fiscal_year, :total_amount, :service, :customer, :vehicle, :date, :due_date, :devizna, :extra_notes)
    end
end
