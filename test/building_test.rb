require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'
require './lib/building'

class BuildingTest < Minitest::Test

  def test_it_exists
      building = Building.new

      assert_instance_of Building, building
  end

  def test_it_has_no_units
    building = Building.new

    assert_equal building.units, []
  end

  def test_it_can_add_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)

    assert_equal building.units.length, 2
  end

  def test_it_can_add_renters
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)
    renter1 = Renter.new("Jessie")
    renter2 = Renter.new("Tim")

    building.units[0].add_renter(renter1)
    building.units[1].add_renter(renter2)


    assert_equal building.renters.length, 2
  end

  def test_it_can_display_average_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)
    renter1 = Renter.new("Jessie")
    renter2 = Renter.new("Tim")

    assert_equal building.average_rent, 1099.5
  end

  def test_it_can_display_empty_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "B2", monthly_rent: 2000, bathrooms: 2, bedrooms: 4})
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)

    renter1 = Renter.new("Jessie")
    renter2 = Renter.new("Tim")
    building.units[0].add_renter(renter1)
    building.units[1].add_renter(renter2)

    assert_equal building.empty_units, [building.units[2]]
  end

  def test_it_can_display_rented_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "B2", monthly_rent: 2000, bathrooms: 2, bedrooms: 4})
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)

    renter1 = Renter.new("Jessie")
    renter2 = Renter.new("Tim")
    building.units[0].add_renter(renter1)
    building.units[1].add_renter(renter2)

    assert_equal building.rented_units, [unit1, unit2]
  end

  def test_it_can_display_renter_with_highest_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "B2", monthly_rent: 2000, bathrooms: 2, bedrooms: 4})
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)

    renter1 = Renter.new("Jessie")
    renter2 = Renter.new("Tim")
    building.units[0].add_renter(renter1)
    building.units[1].add_renter(renter2)

    assert_equal building.renter_with_highest_rent, unit1.renter
  end

  def test_it_can_display_units_by_number_of_bedrooms
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "B2", monthly_rent: 2000, bathrooms: 2, bedrooms: 4})
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)


    assert_equal building.units_by_number_of_bedrooms, {4=>"B2", 2=>"B2", 1=>"A1"}
  end

  def test_it_can_display_annual_breakdown
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    unit3 = Apartment.new({number: "B2", monthly_rent: 2000, bathrooms: 2, bedrooms: 4})
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)


    assert_equal building.annual_breakdown, 2
  end





end
