class Apartment
  attr_reader :info, :number,
              :monthly_rent,
              :bedrooms, :bathrooms

  def initialize(info={})
    @info = info
    @number = info[:number]
    @monthly_rent = monthly_rent
    @bedrooms = bedrooms
    @bathrooms = bathrooms
  end

  def number
    @number
  end

end
