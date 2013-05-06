require 'spec_helper'

describe PhoneNumber do

  let(:phone_number) { PhoneNumber.new }

  context "when created with valid params" do
    let(:valid_params) do
      { number: "15551111221", person_id: 1 }
    end

    let(:phone_number) { PhoneNumber.new valid_params }

    it "is valid" do
      expect(phone_number).to be_valid
    end

  end

  it { should validate_presence_of(:number) }

  it { should belong_to(:person) }

  context "when not associated with a person" do
    it "is invalid" do
      expect(phone_number).to be_invalid
    end

    it "have errors" do
      expect(phone_number).to have(1).error_on(:person_id)
    end

  end
end
