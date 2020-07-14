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

  def units_by_number_of_bedrooms
    number_bedrooms = {}
    bedrooms = units.sort_by{ |unit| unit.bedrooms}.reverse
    bedrooms.each{ |units| number_bedrooms[units.bedrooms] = units.number}
    number_bedrooms
  end

  def annual_breakdown
    annual_cost = {}
    rented_units.collect{ |unit| annual_cost[unit.renter.name] = (unit.monthly_rent * 12)}
    annual_cost
  end

  def rooms_by_renter
    rooms = {}
    rooms_only = {}
    bathrooms = rented_units.each{ |room| rooms_only[:bathrooms] = room.bathrooms}
    bedrooms = rented_units.each{ |room| rooms_only[:bedrooms] = room.bedrooms}
    rented_units.each{ |room| rooms[room.renter] = rooms_only}
    rooms

  end



end
