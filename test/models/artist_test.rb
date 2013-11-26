require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  test "#create creates an artist" do
    assert_difference "Artist.count" do
      Artist.create(name: "New Artist", role: "Singer")       
    end
  end
end
