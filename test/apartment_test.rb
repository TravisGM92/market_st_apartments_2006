require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'

class ApartmentTest < Minitest::Test

  def test_it_exists
      apt = Apartment.new

      assert_instance_of Apartment, apt
  end

  def test_it_has_a_name

  end

end
