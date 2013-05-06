shared_examples "an invalid person" do
  it 'is invalid' do
    expect(person).to be_invalid
  end

  it 'has errors' do
    person.valid?
    expect(person).to have(1).error_on(attribute)
    # expect(person.errors[:last_name]).to include("MEOW MEOW last name can't be blank MEOW MEOW!")
    # TOO GENERIC: person.errors.length == 1
    # person.errors[:last_name].length == 1
  end
end