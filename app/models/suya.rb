class Suya < ActiveRecord::Base
  validates :spicy, inclusion: { in: [true, false]}
  validates :meat, presence: true
  belongs_to :vendor
end
