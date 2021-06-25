# frozen_string_literal: true

Cdr::Cdr.add_partitions

vendor = Contractor.find_or_create_by!(name: 'seed_vendor', enabled: true, vendor: true, customer: false)
vendor_acc = Account.find_or_create_by!(name: 'seed_vendor_acc', contractor: vendor)

routing_plan = Routing::RoutingPlan.find_or_create_by!(name: 'seed_routing_plan')
rate_plan = Routing::Rateplan.find_or_create_by!(name: 'seed_routing_plan')
customer = Contractor.find_or_create_by!(name: 'seed_customer', enabled: true, vendor: false, customer: true)
customer_acc = Account.find_or_create_by!(name: 'seed_customer_acc', contractor: customer)
customer_gw = Gateway.find_or_create_by!(name: 'seed_customer_gw', contractor: customer, allow_origination: true, allow_termination: false, enabled: true, incoming_auth_password: 'pw', incoming_auth_username: 'us')
customer_auth = CustomersAuth.find_or_create_by!(name: 'seed_customer_acc', customer: customer, account: customer_acc, gateway: customer_gw, routing_plan: routing_plan, rateplan: rate_plan, require_incoming_auth: true)
pop = Pop.find_or_create_by!(id: 100_500, name: 'seed-UA')

200.times do
  dur = rand(-1000..6199)
  initial_time = Time.now.utc - 3600 * 24 * 30
  if dur > 0
    connect_time = initial_time + rand(40)
    end_time = connect_time + dur
    success = true
  else
    dur = 0
    connect_time = nil
    end_time = initial_time + rand(120)
    success = false
  end
  Cdr::Cdr.create!(
    time_start: initial_time,
    time_connect: connect_time,
    time_end: end_time,
    disconnect_initiator: DisconnectInitiator.offset(rand(DisconnectInitiator.count)).first,
    routing_attempt: 1,
    is_last_cdr: true,
    success: success,
    destination_prefix: 380,
    dialpeer_prefix: 380,
    customer: customer,
    customer_acc: customer_acc,
    vendor: vendor,
    vendor_acc: vendor_acc,
    duration: dur,
    customer_duration: dur,
    customer_price: rand,
    vendor_duration: dur,
    vendor_price: rand,
    dst_country: System::Country.offset(rand(System::Country.count)).first,
    dst_network: System::Network.offset(rand(System::Network.count)).first,
    orig_gw: customer_gw,
    customer_auth: customer_auth,
    auth_orig_ip: '1.1.1.1',
    auth_orig_port: 5060,
    pop_id: pop.id,
    src_prefix_in: '11111111111',
    dst_prefix_in: '22222222222',
    lega_identity: '[{"header":{"alg":"ES256","ppt":"shaken","typ":"passport","x5u":"http://127.0.0.1/share/test.pem"},"parsed":true,"payload":{"attest":"C","dest":{"tn":"456","uri":"sip:456"},"iat":1622830203,"orig":{"tn":"123","uri":"sip:123"},"origid":"8-000F7304-60BA6C7B000B6828-A43657C0"},"verified":true},{"error_code":4,"error_reason":"Incorrect Identity Header Value","parsed":false},{"error_code":-1,"error_reason":"certificate is not available","header":{"alg":"ES256","ppt":"shaken","typ":"passport","x5u":"http://127.0.0.1/share/test2.pem"},"parsed":true,"payload":{"attest":"C","dest":{"tn":"13"},"iat":1622831252,"orig":{"tn":"42"},"origid":"8-000F7304-60BA7094000207EC-2B5F27C0"},"verified":false}]'
  )
end
