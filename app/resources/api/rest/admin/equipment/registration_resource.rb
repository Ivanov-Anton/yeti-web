# frozen_string_literal: true

class Api::Rest::Admin::Equipment::RegistrationResource < ::BaseResource
  model_name 'Equipment::Registration'
  paginator :paged

  attributes :auth_password,
             :auth_user,
             :contact,
             :display_username,
             :domain,
             :enabled,
             :expire,
             :force_expire,
             :max_attempts,
             :name,
             :proxy,
             :retry_delay,
             :sip_interface_name,
             :username

  has_one :transport_protocol, class_name: 'TransportProtocol'
  has_one :sip_schema, class_name: 'SipSchema'
  has_one :proxy_transport_protocol, class_name: 'TransportProtocol'
  has_one :pop, class_name: 'Pop'
  has_one :node, class_name: 'Node'
end
