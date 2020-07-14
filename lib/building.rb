require './lib/apartment'
require './lib/renter'

class Building
  attr_reader :units

  def initialize
    @units = []

  end

end
