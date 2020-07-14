require './lib/renter'

class Apartment
  attr_reader :info, :number,
              :monthly_rent,
              :bedrooms, :bathrooms,
              :renter

  def initialize(info={})
    @info = info
    @number = info[:number]
    @monthly_rent = info[:monthly_rent]
    @bedrooms = info[:bedrooms]
    @bathrooms = info[:bathrooms]
    @renter = nil
  end


end
