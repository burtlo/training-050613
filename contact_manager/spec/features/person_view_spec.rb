require 'spec_helper'

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  it 'is able to create a phone number' do
    visit person_path(person)
    click_link 'Add phone number'
    fill_in('Number', with: '555-9191')
    click_button('Create Phone number')
    expect(current_path).to eq person_path(person)
    expect(page).to have_content "Phone: 555-9191"
  end

end