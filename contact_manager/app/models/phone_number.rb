class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :person_id

  belongs_to :person

  validates :person_id, presence: true
  validates :number, presence: true
end
