# frozen_string_literal: true

FactoryBot.define do
  factory :contact, class: Afterpay::Components::Contact do
    name         { Faker::Lorem.word }
    line1        { Faker::Address.street_address }
    area1        { Faker::Address.city }
    region       { Faker::Address.state }
    postcode     { Faker::Address.postcode }
    country_code { Faker::Address.country_code }
    phone_number { Faker::PhoneNumber.cell_phone }

    factory :billing do
      name { 'Billing' }
    end

    factory :shipping do
      name { 'Shipping' }
    end
  end
end
