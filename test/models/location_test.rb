require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "#create creates a Location" do
    assert_difference "Location.count" do
      Location.create(venue: "New Location")       
    end
  end
end
