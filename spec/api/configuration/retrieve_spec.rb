require 'spec_helper'

describe Afterpay::API::Configuration::Retrieve do
  describe '#call' do
    let(:type)           { 'PAY_BY_INSTALLMENT' }
    let(:minimum_amount) { build(:money) }
    let(:maximum_amount) { build(:money)}
    let(:raw_response)   do
      JSON.generate([{
        type: type,
        minimumAmount: minimum_amount,
        maximumAmount: maximum_amount
      }])
    end

    before(:each) do
      stub_request(:get, /api.us.afterpay.com\/v2\/configuration/)
        .to_return(
          status: 200,
          body: raw_response,
          headers: { 'Content-Type' => 'application/json' }
        )
    end

    it 'returns a list of payment configuration' do
      expect(described_class.call.body).to be_instance_of Array
    end

    describe 'each configuration' do
      it 'includes type' do
        configuration = described_class.call.body.first

        expect(configuration).to      include :type
        expect(configuration.type).to eq      type
      end

      it 'includes minimum amount' do
        configuration = described_class.call.body.first

        expect(configuration).to               include :minimumAmount
        expect(configuration.minimumAmount).to eq      minimum_amount.as_json
      end

      it 'includes maximum amount' do
        configuration = described_class.call.body.first

        expect(configuration).to               include :maximumAmount
        expect(configuration.maximumAmount).to eq      maximum_amount.as_json
      end
    end
  end
end
