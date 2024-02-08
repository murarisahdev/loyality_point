class InvoicesController < ApplicationController
  # GET /invoices or /invoices.json
  def index
    @invoices = current_user.invoices
    @rewards = current_user.loyalty_rewards
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = current_user.invoices.new(invoice_params)

    if @invoice.save
      redirect_to invoices_url, notice: "Invoice was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def invoice_params
    params.require(:invoice).permit(:amount, :invoice_date, :foreign_country_investment)
  end
end
