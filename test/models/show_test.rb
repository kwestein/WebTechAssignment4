require 'test_helper'

class ShowTest < ActiveSupport::TestCase
  test "#create creates a show" do
    assert_difference "Show.count" do
      Show.create(title: "New Show")       
    end
  end
end
