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


end