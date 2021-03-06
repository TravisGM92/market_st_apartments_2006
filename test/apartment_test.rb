require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'

class ApartmentTest < Minitest::Test

  def test_it_exists
      apt = Apartment.new

      assert_instance_of Apartment, apt
  end

  def test_it_has_number
    apt = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_equal apt.number, "A1"
  end

  def test_it_has_monthly_rent
    apt = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_equal apt.monthly_rent, 1200
  end

  def test_it_can_show_number_of_bedrooms
    apt = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_equal apt.bedrooms, 1
  end

  def test_it_can_show_number_of_bathrooms
    apt = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_equal apt.bathrooms, 1
  end

  def test_it_has_no_renter
    apt = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_nil apt.renter, nil
  end

  def test_it_can_add_renter
    apt = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    renter1 = Renter.new("Jessie")
    apt.add_renter(renter1)

    assert_equal apt.renter, renter1
  end


end
