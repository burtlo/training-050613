class ChangePhoneNumbersToUseContacts < ActiveRecord::Migration

  class PhoneNumber < ActiveRecord::Base ; end

  def up
    PhoneNumber.destroy_all
    remove_column :phone_numbers, :person_id
    add_column :phone_numbers, :contact_id, :integer
    add_column :phone_numbers, :contact_type, :string
  end

  def down
    raise ActiveRecord::IrreverisbleMigration
  end
end
