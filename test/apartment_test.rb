require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'

class ApartmentTest < Minitest::Test

  def test_it_exists
      apt = Apartment.new

      assert_instance_of Apartment, apt
  end

  def test_it_has_info
    apt = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_equal apt.number, "A1"
  end

end
