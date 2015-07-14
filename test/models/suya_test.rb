require 'test_helper'

class SuyaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Suya is valid with a meat and spicy" do
    suya = Suya.new(meat: "beef", spicy: true)

    suya.save

    assert suya.valid?
    require 'pry'; binding.pry
    assert_equal 1, Suya.count
  end

  test "Suya is not valid without a meat" do
    suya = Suya.new(meat: nil, spicy: true)

    assert suya.invalid?
    refute suya.valid?
  end

  test "Suya is not valid without a spiciness level" do
    suya = Suya.new(meat: "beef", spicy: nil)

    assert suya.invalid?
  end

  test "Suya belongs to a vendor" do
    vendor = Vendor.create(name: "Jeff")
    suya = Suya.create(meat: "beef", spicy: true)

    suya.vendor = vendor

    refute suya.vendor.blank?
    assert_equal "Jeff", suya.vendor.name
  end
end
