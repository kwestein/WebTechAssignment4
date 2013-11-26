require 'test_helper'

class BandTest < ActiveSupport::TestCase
  test "#create creates a band" do
    assert_difference "Band.count" do
      Band.create(name: "New Band")       
    end
  end
end
