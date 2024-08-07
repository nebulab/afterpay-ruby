# frozen_string_literal: true

FactoryBot.define do
  factory :refund, class: Afterpay::Components::Refund do
    merchant_reference { Faker::Lorem.characters(number: 5) }
    amount             { build(:money) }
  end
end
