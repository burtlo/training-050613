require 'spec_helper'

describe Company do
  let(:company) { described_class.new }

  it { should validate_presence_of(:name) }

  it { should have_many(:phone_numbers) }

  it "has a phone number" do
    company.phone_numbers.build number: "333-3333"
    expect(company.phone_numbers.first.number).to eq('333-3333')
  end
end
