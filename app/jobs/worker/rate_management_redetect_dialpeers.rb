# frozen_string_literal: true

module Worker
  class RateManagementRedetectDialpeers < ApplicationJob
    queue_as 'rate_management'

    def perform(pricelist_id)
      pricelist = RateManagement::Pricelist.find_by(id: pricelist_id)
      return if pricelist.nil?

      RateManagement::RedetectDialpeers.call(pricelist: pricelist)
    end
  end
end
