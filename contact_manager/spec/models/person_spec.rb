require 'spec_helper'

describe Person do

  context "when created with correct params" do
    it "is valid" do
      pending
      expect(Person.new).to be_valid
    end

  end



  context "when missing the last name" do
    let(:person) { Person.new first_name: "Yolanda" }

    let(:attribute) { :last_name }

    it_behaves_like "an invalid person"
  end

  context "when missing a first name" do
    let(:person) { Person.new last_name: "Davis" }

    let(:attribute) { :first_name }

    it_behaves_like "an invalid person"
  end
end
