class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, length: {is: 10}
  validates :phone_number, :name, uniqueness: true
end
