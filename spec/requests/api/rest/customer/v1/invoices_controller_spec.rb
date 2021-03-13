# frozen_string_literal: true

RSpec.describe Api::Rest::Customer::V1::InvoicesController, type: :request do
  include_context :json_api_customer_v1_helpers, type: :invoices

  describe 'GET /api/rest/customer/v1/invoices' do
    subject do
      get json_api_request_path, params: json_api_request_query, headers: json_api_request_headers
    end

    let(:json_api_request_query) { nil }

    before { Billing::Invoice.delete_all }
    let!(:accounts) { create_list(:account, 2, contractor: customer) }
    let!(:other_customer) { create(:customer) }
    let!(:other_customer_account) { create(:account, contractor: other_customer) }
    before do
      # skip invoices for the other customer
      create(:invoice, :customer, :manual, :approved, account: other_customer_account)

      # skip vendor invoices
      create(:invoice, :vendor, :manual, :approved, account: accounts.first)

      # skip not approved invoices
      create(:invoice, :customer, :manual, :new, account: accounts.first)
      create(:invoice, :customer, :manual, :pending, account: accounts.second)
    end
    let!(:invoices) do
      [
        create(
          :invoice,
          :customer,
          :manual,
          :approved,
          account: accounts.first,
          start_date: 30.days.ago.utc,
          end_date: 25.days.ago.utc
        ),
        create(:invoice, :customer, :auto_full, :approved, account: accounts.first),
        create(:invoice, :customer, :manual, :approved, account: accounts.second),
        create(
          :invoice,
          :customer,
          :auto_partial,
          :approved,
          account: accounts.second,
          start_date: 25.days.ago.utc,
          end_date: 21.days.ago.utc
        )
      ]
    end

    it_behaves_like :json_api_check_authorization

    it_behaves_like :json_api_check_pagination do
      let!(:accounts) do
        create_list(:account, records_qty, contractor: customer)
      end
      let!(:invoices) do
        (0...records_qty).map do |i|
          create(:invoice, :customer, :manual, :approved, account: accounts[i])
        end
      end

      let(:json_api_request_query) { { sort: 'start_date' } }
      let(:records_ids) { invoices.sort_by(&:start_date).map(&:uuid) }
    end

    context 'account_ids is empty' do
      it 'returns records of this customer' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |data| data[:id] }
        expect(actual_ids).to match_array invoices.map(&:uuid)
      end
    end

    context 'with account_ids' do
      before do
        # allowed accounts
        create(:customers_auth, customer: customer, account: accounts.first)
        create(:customers_auth, customer: customer, account: accounts.second)
        api_access.update!(account_ids: accounts.map(&:id))

        # not allowed account and it's invoice
        not_allowed_account = create(:account, contractor: customer)
        create(:invoice, :customer, :auto_full, :approved, account: not_allowed_account)
      end

      it 'returns records of this customer' do
        subject
        expect(response.status).to eq(200)
        actual_ids = response_json[:data].map { |data| data[:id] }
        expect(actual_ids).to match_array invoices.map(&:uuid)
      end
    end
  end

  describe 'GET /api/rest/customer/v1/invoices/{id}' do
    subject do
      get json_api_request_path, params: nil, headers: json_api_request_headers
    end

    let(:json_api_request_path) { "#{super()}/#{record_id}" }
    let(:record_id) { invoice.uuid }

    let!(:account) { create(:account, contractor: customer) }
    let!(:invoice) do
      create(:invoice, :customer, :auto_full, :approved, account: account)
    end

    it_behaves_like :json_api_check_authorization

    context 'when record exists' do
      it 'returns record with expected attributes' do
        subject
        expect(response_json[:data]).to match(
          id: invoice.uuid,
          type: 'invoices',
          links: anything,
          attributes: {
            reference: invoice.reference,
            'start-date': invoice.start_date.iso8601(3),
            'end-date': invoice.end_date.iso8601(3),
            amount: invoice.amount.to_s,
            'calls-count': invoice.calls_count,
            'successful-calls-count': invoice.successful_calls_count,
            'calls-duration': invoice.calls_duration,
            'billing-duration': invoice.billing_duration,
            'first-call-at': invoice.first_call_at&.iso8601(3),
            'last-call-at': invoice.last_call_at&.iso8601(3),
            'first-successful-call-at': invoice.first_successful_call_at&.iso8601(3),
            'last-successful-call-at': invoice.last_successful_call_at&.iso8601(3),
            'has-pdf': invoice.invoice_document&.pdf_data.present?
          },
          relationships: {
            account: {
              links: anything
            }
          }
        )
      end
    end

    context 'when invoice account not listed in allowed_ids' do
      before do
        allowed_account = create(:account, contractor: customer)
        api_access.update!(account_ids: [allowed_account.id])
      end

      include_examples :responds_with_status, 404
    end
  end
end
