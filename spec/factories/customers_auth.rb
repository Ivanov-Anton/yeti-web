# frozen_string_literal: true

FactoryBot.define do
  factory :customers_auth, class: CustomersAuth do
    sequence(:name) { |n| "customers_auth_#{n}" }
    diversion_policy_id { 1 }
    dump_level_id { 1 }

    association :customer, factory: :contractor, customer: true
    association :rateplan
    association :routing_plan
    association :gateway
    association :account
    association :lua_script

    # ip { ['127.0.0.0/8'] } # default
    src_number_field_id { 1 }
    src_rewrite_rule { nil }
    src_rewrite_result { nil }

    dst_number_field_id { 1 }
    dst_rewrite_rule { nil }
    dst_rewrite_result { nil }

    pop_id { nil }

    src_name_field_id { 1 }
    src_name_rewrite_rule { nil }
    src_name_rewrite_result { nil }

    diversion_rewrite_rule { nil }
    diversion_rewrite_result { nil }
    dst_numberlist_id { nil }
    src_numberlist_id { nil }
    allow_receive_rate_limit { false }
    send_billing_information { false }

    trait :with_incoming_auth do
      association :gateway, factory: %i[gateway with_incoming_auth]
      require_incoming_auth { true }
    end

    trait :with_reject do
      reject_calls { true }
    end

    trait :filled do
      with_incoming_auth
      with_reject
      tag_action { Routing::TagAction.take || FactoryBot.create(:tag_action) }
    end

    trait :with_external_id do
      sequence(:external_id)
    end
  end
end
