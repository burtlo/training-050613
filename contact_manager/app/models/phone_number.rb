class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :contact_id, :contact_type, :contact

  # contact_id, contact_type (e.g. 'person', 'company')
  belongs_to :contact, polymorphic: true

  validates :contact_id, presence: true
  validates :contact_type, presence: true
  validates :number, presence: true
end
