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


end
