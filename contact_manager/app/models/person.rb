class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  # THIS IS BROKE!
  # validates :last_name, presence: true, message: "MEOW MEOW can't be blank MEOW MEOW!"

  # This is OK! What about the world?
  # validates :last_name, presence: { value: true, message: "MEOW MEOW can't be blank MEOW MEOW!" }

  # THIS IS BROKE! But we thought about the world?
  # validates :last_name, presence: { value: true, message: t("validation.fails.person.last_name") }

  validates :last_name, presence: true
  validates :first_name, presence: true

  has_many :phone_numbers

end
