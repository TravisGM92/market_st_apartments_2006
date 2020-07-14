require './lib/renter'

class Apartment
  attr_reader :info, :number,
              :monthly_rent,
              :bedrooms, :bathrooms
  attr_accessor :renter

  def initialize(info={})
    @info = info
    @number = info[:number]
    @monthly_rent = info[:monthly_rent]
    @bedrooms = info[:bedrooms]
    @bathrooms = info[:bathrooms]
  end

  def renter
    info[:renter]
  end

  def add_renter(renter_name)
    info[:renter] = renter_name
  end


end
