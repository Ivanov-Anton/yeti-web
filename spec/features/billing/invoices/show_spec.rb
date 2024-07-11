# frozen_string_literal: true

RSpec.describe 'Invoices show page', js: true, bullet: [:n] do
  subject do
    visit invoice_path(invoice.id)
  end

  include_context :login_as_admin
  let!(:invoice) { FactoryBot.create(:invoice, :manual, :pending, :with_vendor_account, reference: 'test-invoice') }

  it 'displays invoice attributes' do
    subject
    expect(page).to have_attribute_row('ID', exact_text: invoice.id.to_s)
    expect(page).to have_attribute_row('UUID', exact_text: invoice.uuid)
    expect(page).to have_attribute_row('REFERENCE', exact_text: invoice.reference)
    expect(page).not_to have_action_item('Files')
  end

  context 'when invoice has document' do
    before do
      FactoryBot.create(:invoice_document, invoice:)
    end

    it 'displays download links' do
      subject
      expect(page).to have_attribute_row('ID', exact_text: invoice.id.to_s)

      expect(page).to have_action_item('Files')
      click_action_item('Files') # opens dropdown
      expect(page).to have_action_item('Document (ODT format)')
      expect(page).to have_action_item('Document (PDF format)')
    end
  end
end
