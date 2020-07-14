require './lib/apartment'
require './lib/renter'

class Building
  attr_reader :units

  def initialize(units=[])
    @units = units
  end

  def add_unit(unit)
    units << unit
  end

  def renters
    units.map{ |unit| unit.renter}
  end

  def average_rent
    units.sum{ |unit| unit.monthly_rent.to_f} / units.length
  end

  def empty_units
    units.select{ |unit| unit.renter == nil}
  end

  def rented_units
    units.select{ |unit| not unit.renter == nil}
  end

  def renter_with_highest_rent
    rented_units.max_by{ |unit| unit.monthly_rent}.renter
  end

end
