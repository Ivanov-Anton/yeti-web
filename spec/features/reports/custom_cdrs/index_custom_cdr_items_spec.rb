# frozen_string_literal: true

RSpec.describe 'Index custom cdr custom items', js: true do
  subject do
    visit custom_cdr_custom_items_path report.id
  end

  include_context :login_as_admin

  let!(:report) do
    FactoryBot.create(:custom_cdr, group_by: group_by)
  end
  let!(:custom_data) do
    FactoryBot.create(:custom_data,
                      rateplan: rateplan,
                      report: report,
                      customer: customer,
                      vendor: vendor,
                      routing_group: routing_group,
                      orig_gw: orig_gw,
                      term_gw: term_gw,
                      destination: destination,
                      dialpeer: dialpeer,
                      customer_auth: customer_auth,
                      vendor_acc: vendor_acc,
                      customer_acc: customer_acc,
                      vendor_invoice: vendor_invoice,
                      customer_invoice: customer_invoice,
                      node: node,
                      pop: pop,
                      dst_country: dst_country,
                      dst_network: dst_network,
                      destination_rate_policy_id: destination_rate_policy_id,
                      disconnect_initiator_id: disconnect_initiator_id,
                      src_country: src_country,
                      src_network: src_network,
                      dst_area: dst_area,
                      src_area: src_area)
  end

  let(:group_by) do
    %w[
      rateplan_id
      routing_group_id
      orig_gw_id
      term_gw_id
      destination_id
      dialpeer_id
      customer_auth_id
      vendor_acc_id
      customer_acc_id
      vendor_id
      customer_id
      vendor_invoice_id
      customer_invoice_id
      node_id
      pop_id
      dst_country_id
      dst_network_id
      src_country_id
      src_network_id
      src_area_id
      dst_area_id
      destination_rate_policy_id
      disconnect_initiator_id
    ]
  end

  let(:customer) { FactoryBot.create(:customer) }
  let(:vendor) { FactoryBot.create(:vendor) }
  let(:rateplan) { FactoryBot.create(:rateplan) }
  let(:destination_rate_policy_id) { Routing::DestinationRatePolicy::POLICY_FIXED }
  let(:disconnect_initiator_id) { Cdr::Cdr::DISCONNECT_INITIATOR_SWITCH }
  let(:routing_group) { FactoryBot.create(:routing_group) }
  let(:orig_gw) { FactoryBot.create(:gateway) }
  let(:term_gw) { FactoryBot.create(:gateway) }
  let(:destination) { FactoryBot.create(:destination, prefix: '380') }
  let(:dialpeer) { FactoryBot.create(:dialpeer, prefix: '380') }
  let(:customer_auth) { FactoryBot.create(:customers_auth) }
  let(:vendor_acc) { FactoryBot.create(:account) }
  let(:customer_acc) { FactoryBot.create(:account, :with_customer) }
  let(:vendor_invoice) { FactoryBot.create(:invoice, :vendor, :approved, :auto_full, account: vendor_acc) }
  let(:customer_invoice) { FactoryBot.create(:invoice, :customer, :approved, :auto_full, account: customer_acc) }
  let(:node) { FactoryBot.create(:node) }
  let(:pop) { FactoryBot.create(:pop) }
  let(:dst_country) { System::Country.take }
  let(:dst_network) { System::Network.take }
  let(:src_country) { System::Country.take }
  let(:src_network) { System::Network.take }
  let(:dst_area) { FactoryBot.create(:area) }
  let(:src_area) { FactoryBot.create(:area) }

  it 'should have table with correct data' do
    subject
    expect(page).to have_table
    within_table_row(id: custom_data.id) do
      expect(page).to have_table_cell(text: customer.display_name, column: 'Customer')
      expect(page).to have_table_cell(text: vendor.display_name, column: 'Vendor')
      expect(page).to have_table_cell(text: rateplan.display_name, column: 'Rateplan')
      expect(page).to have_table_cell(text: routing_group.display_name, column: 'Routing Group')
      expect(page).to have_table_cell(text: orig_gw.display_name, column: 'Orig Gw')
      expect(page).to have_table_cell(text: term_gw.display_name, column: 'Term Gw')
      expect(page).to have_table_cell(text: destination.display_name, column: 'Destination')
      expect(page).to have_table_cell(text: dialpeer.display_name, column: 'Dialpeer')
      expect(page).to have_table_cell(text: customer_auth.display_name, column: 'Customer Auth')
      expect(page).to have_table_cell(text: vendor_acc.display_name, column: 'Vendor Acc')
      expect(page).to have_table_cell(text: customer_acc.display_name, column: 'Customer Acc')
      expect(page).to have_table_cell(text: vendor_invoice.display_name, column: 'Vendor Invoice')
      expect(page).to have_table_cell(text: customer_invoice.display_name, column: 'Customer Invoice')
      expect(page).to have_table_cell(text: node.name, column: 'Node')
      expect(page).to have_table_cell(text: pop.name, column: 'Pop')
      expect(page).to have_table_cell(text: dst_country.name, column: 'Dst Country')
      expect(page).to have_table_cell(text: dst_network.name, column: 'Dst Network')
      expect(page).to have_table_cell(text: src_country.name, column: 'Src Country')
      expect(page).to have_table_cell(text: src_network.name, column: 'Src Network')
      expect(page).to have_table_cell(text: src_area.display_name, column: 'Src Area')
      expect(page).to have_table_cell(text: dst_area.display_name, column: 'Dst Area')
      expect(page).to have_table_cell(text: 'Fixed', column: 'Destination Rate Policy')
      expect(page).to have_table_cell(text: 'Switch', column: 'Disconnect Initiator')
    end
  end
end
