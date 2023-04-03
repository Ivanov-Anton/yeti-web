# frozen_string_literal: true

FactoryBot.define do
  factory :smtp_connection, class: System::SmtpConnection do
    sequence(:name) { |n| "smtp_connection#{n}" }
    host { 'host' }
    port { '25' }
    from_address { 'address@email.com' }
    global { true }

    trait :filled do
      contractors { build_list :customer, 2 }
    end
  end
end
