# frozen_string_literal: true

FactoryBot.define do
  factory :order, class: Afterpay::Components::Order do
    payment_type       { 'PAY_BY_INSTALLMENT' }

    merchant_reference { Faker::Lorem.characters(number: 5) }

    amount             { build(:money) }
    tax_amount         { build(:money) }
    shipping_amount    { build(:money) }
    consumer           { build(:consumer) }
    billing            { build(:billing) }
    shipping           { build(:shipping) }
    courier            { build(:courier) }
    merchant           { build(:merchant) }

    items              { build_list(:item, 2) }
    discounts          { build_list(:discount, 2) }
  end
end
