# frozen_string_literal: true

RSpec.describe 'Sip Options Probers', js: true do
  include_context :login_as_admin
  include_context :stub_parallel_map

  let!(:nodes) { create_list(:node, 2) }
  let(:record_attributes) do
    [
      FactoryBot.attributes_for(:realtime_sip_options_prober, :filled, node_id: nodes.first.id),
      FactoryBot.attributes_for(:realtime_sip_options_prober, :filled, node_id: nodes.second.id)
    ]
  end

  describe 'index page' do
    subject do
      visit sip_options_probers_path
    end

    before do
      stub_jrpc_request(nodes.first.rpc_endpoint, 'options_prober.show.probers', [])
        .and_return([record_attributes.first.stringify_keys])
      stub_jrpc_request(nodes.second.rpc_endpoint, 'options_prober.show.probers', [])
        .and_return([record_attributes.second.stringify_keys])
    end

    it 'returns correct Sip Options Probers' do
      subject

      expect(page).to have_table
      expect(page).to have_table_row count: nodes.size
      nodes.each { |node| expect(page).to have_link(node.name, href: node_path(node.id)) }
      record_attributes.each do |record_attribute|
        expect(page).to have_link(record_attribute[:name], href: equipment_sip_options_prober_path(record_attribute[:id]))
      end
      record_attributes.each { |record_attribute| expect(page).to have_table_cell column: 'Id', text: record_attribute[:id] }
    end
  end

  describe 'show page' do
    subject do
      visit sip_options_probers_path
      click_link(href: sip_options_prober_path("#{nodes.first[:id]}*#{record_attributes.first[:id]}"))
    end

    before do
      stub_jrpc_request(nodes.second.rpc_endpoint, 'options_prober.show.probers', [])
        .and_return([record_attributes.second.stringify_keys])

      # using single connection to perform both request because of NodeApi logic.
      api_stub = stub_jrpc_connect(nodes.first.rpc_endpoint)
      stub_jrpc_request(api_stub, 'options_prober.show.probers', [])
        .and_return([record_attributes.first.stringify_keys])
      stub_jrpc_request(api_stub, 'options_prober.show.probers', [record_attributes.first[:id].to_s])
        .and_return([record_attributes.first.stringify_keys])
    end

    it 'returns correct Sip Options Prober{#id}' do
      subject

      expect(page).to have_attribute_row('ID', exact_text: record_attributes.first[:id])
      record_attributes.first.each do |attribute, _value|
        next if attribute == :node_id

        expect(page).to have_attribute_row(attribute.to_s.upcase)
      end
    end
  end
end
