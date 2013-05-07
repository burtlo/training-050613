require 'spec_helper'

describe PhoneNumber do

  let(:phone_number) { PhoneNumber.new }

  context "when created with valid params" do
    let(:valid_params) do
      { number: "15551111221", contact_id: person.id, contact_type: 'Person' }
    end

    let(:person) { Person.create first_name: "Frank", last_name: "Webber" }

    let(:phone_number) { PhoneNumber.new valid_params }

    it "is valid" do
      expect(phone_number).to be_valid
    end

    it "have a contact" do
      expect(phone_number.contact).to_not be_nil
    end

  end

  it { should validate_presence_of(:number) }

  context "when not associated with a person" do
    it "is invalid" do
      expect(phone_number).to be_invalid
    end

    it "have errors" do
      expect(phone_number).to have(1).error_on(:contact_id)
    end

  end
end
