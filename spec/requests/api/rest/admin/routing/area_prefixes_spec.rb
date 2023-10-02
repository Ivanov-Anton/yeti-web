# frozen_string_literal: true

RSpec.describe Api::Rest::Admin::Routing::AreaPrefixesController, type: :request do
  include_context :json_api_admin_helpers, type: :'area-prefixes', prefix: 'routing'

  describe 'GET /api/rest/admin/routing/area-prefixes' do
    subject do
      get json_api_request_path, params: nil, headers: json_api_request_headers
    end

    let!(:area_prefixes) do
      FactoryBot.create_list(:area_prefix, 2)
    end

    include_examples :jsonapi_responds_with_pagination_links
    include_examples :returns_json_api_collection do
      let(:json_api_collection_ids) do
        area_prefixes.map { |r| r.id.to_s }
      end
    end

    it_behaves_like :json_api_admin_check_authorization
  end

  describe 'API Log recording' do
    subject { get json_api_request_path, params: nil, headers: json_api_request_headers }

    context 'when controller contains meta info' do
      before { allow_any_instance_of(described_class).to receive(:meta).and_return({ foo: :bar }) }

      it 'creates Log::ApiLog with meta and remote IP' do
        expect { subject }.to change { Log::ApiLog.count }.by(1)
        expect(Log::ApiLog.last).to have_attributes(meta: { 'foo' => 'bar' }, remote_ip: '127.0.0.1')
      end
    end

    context 'when controller DO NOT contains meta info' do
      before { allow_any_instance_of(described_class).to receive(:meta).and_return(nil) }

      it 'creates Log::ApiLog with meta and remote IP' do
        expect { subject }.to change { Log::ApiLog.count }.by(1)
        expect(Log::ApiLog.last).to have_attributes(meta: nil, remote_ip: '127.0.0.1')
      end
    end
  end
end
