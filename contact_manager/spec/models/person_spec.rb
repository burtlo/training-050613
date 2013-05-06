require 'spec_helper'

describe Person do

  context "when created with correct params" do
    let(:params) do
      { first_name: "Yolanda", last_name: "Davis" }
    end

    let(:person) { Person.new params }

    it "is valid" do
      expect(person).to be_valid
    end
  end

  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:first_name) }

  it { should have_many(:phone_numbers) }

  # context "when missing the last name" do
    let(:person) { Person.new first_name: "Yolanda" }

    let(:attribute) { :last_name }

  #   it_behaves_like "an invalid person"
  # end

  # context "when missing a first name" do
  #   let(:person) { Person.new last_name: "Davis" }

  #   let(:attribute) { :first_name }

  #   it_behaves_like "an invalid person"
  # end
end
