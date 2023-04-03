# frozen_string_literal: true

class Api::Rest::Customer::V1::InvoiceResource < Api::Rest::Customer::V1::BaseResource
  model_name 'Billing::Invoice'

  attributes :reference,
             :start_date,
             :end_date,
             :amount,
             :calls_count,
             :successful_calls_count,
             :calls_duration,
             :billing_duration,
             :first_call_at,
             :last_call_at,
             :first_successful_call_at,
             :last_successful_call_at,
             :has_pdf

  has_one :account, foreign_key_on: :related

  ransack_filter :reference, type: :string
  ransack_filter :start_date, type: :datetime
  ransack_filter :end_date, type: :datetime
  ransack_filter :amount, type: :number
  ransack_filter :calls_count, type: :number
  ransack_filter :successful_calls_count, type: :number
  ransack_filter :calls_duration, type: :number
  ransack_filter :billing_duration, type: :number
  ransack_filter :first_call_at, type: :datetime
  ransack_filter :last_call_at, type: :datetime
  ransack_filter :first_successful_call_at, type: :datetime
  ransack_filter :last_successful_call_at, type: :datetime

  association_uuid_filter :account_id, class_name: 'Account'

  def has_pdf
    _model.invoice_document&.pdf_data.present?
  end

  def self.apply_allowed_accounts(records, options)
    context = options[:context]
    scope = records.for_customer
                   .approved
                   .preload(:invoice_document)
                   .where(contractor_id: context[:customer_id])
    scope = scope.where(account_id: context[:allowed_account_ids]) if context[:allowed_account_ids].present?
    scope
  end
end
