class Vendor < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  has_many :suyas
end
