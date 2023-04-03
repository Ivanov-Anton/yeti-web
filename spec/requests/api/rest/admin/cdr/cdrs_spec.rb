# frozen_string_literal: true

RSpec.describe Api::Rest::Admin::Cdr::CdrsController, type: :request do
  include_context :json_api_admin_helpers, type: :cdrs, prefix: 'cdr'

  describe 'GET /api/rest/admin/cdr/cdrs' do
    subject do
      get json_api_request_path, params: json_api_request_params, headers: json_api_request_headers
    end

    let(:json_api_request_params) { nil }

    let!(:cdrs) do
      FactoryBot.create_list(:cdr, 2)
    end

    include_examples :jsonapi_responds_with_pagination_links
    include_examples :returns_json_api_collection do
      let(:json_api_collection_ids) do
        cdrs.map { |r| r.id.to_s }
      end
    end

    it_behaves_like :json_api_admin_check_authorization

    context 'with filters' do
      let(:json_api_request_params) do
        { filter: filter }
      end

      context 'by src_prefix_in_eq' do
        let(:filter) { { src_prefix_in_eq: '111111111111' } }
        let!(:record) { FactoryBot.create(:cdr, src_prefix_in: '111111111111') }

        include_examples :returns_json_api_collection do
          let(:json_api_collection_ids) { [record.id.to_s] }
        end
      end

      context 'by src_prefix_in_contains' do
        let(:filter) { { src_prefix_in_contains: '11111' } }
        let!(:record) { FactoryBot.create(:cdr, src_prefix_in: '111111111111') }

        include_examples :returns_json_api_collection do
          let(:json_api_collection_ids) { [record.id.to_s] }
        end
      end

      context 'by src_prefix_routing_eq' do
        let(:filter) { { src_prefix_routing_eq: '111111111111' } }
        let!(:record) { FactoryBot.create(:cdr, src_prefix_routing: '111111111111') }

        include_examples :returns_json_api_collection do
          let(:json_api_collection_ids) { [record.id.to_s] }
        end
      end

      context 'by src_prefix_routing_contains' do
        let(:filter) { { src_prefix_routing_contains: '111111' } }
        let!(:record) { FactoryBot.create(:cdr, src_prefix_routing: '111111111111') }

        include_examples :returns_json_api_collection do
          let(:json_api_collection_ids) { [record.id.to_s] }
        end
      end

      context 'by dst_prefix_routing_eq' do
        let(:filter) { { dst_prefix_routing_eq: '111111111111' } }
        let!(:record) { FactoryBot.create(:cdr, dst_prefix_routing: '111111111111') }

        include_examples :returns_json_api_collection do
          let(:json_api_collection_ids) { [record.id.to_s] }
        end
      end

      context 'by dst_prefix_routing_contains' do
        let(:filter) { { dst_prefix_routing_contains: '11111' } }
        let!(:record) { FactoryBot.create(:cdr, dst_prefix_routing: '111111111111') }

        include_examples :returns_json_api_collection do
          let(:json_api_collection_ids) { [record.id.to_s] }
        end
      end
    end
  end
end
