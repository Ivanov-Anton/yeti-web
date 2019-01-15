# frozen_string_literal: true

class Api::Rest::Admin::Equipment::GatewayInbandDtmfFilteringModeResource < ::BaseResource
  model_name 'Equipment::GatewayInbandDtmfFilteringMode'
  immutable
  attributes :name
  filter :name
end
