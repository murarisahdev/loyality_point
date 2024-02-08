require "rails_helper"

RSpec.describe "Invoices", type: :request do
  let!(:user) { FactoryBot.create(:user) }

  before :each do
    login(user)
  end

  it "redirects to the Invoice's page" do
    get "/invoices"

    expect(response).to have_http_status(200)
  end

  it "creates a Invoice and redirects to the Invoice's page" do
    get "/invoices/new"
    expect(response).to have_http_status(200)

    post "/invoices", params: { invoice: { invoice_date: Date.today, amount: "1000", foreign_country_investment: "0" } }

    follow_redirect!

    expect(response).to have_http_status(200)
    expect(response.body).to include("Invoice was successfully created.")
  end
end
