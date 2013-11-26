require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  test "#create creates an album" do
    assert_difference "Album.count" do
      Album.create(title: "New Album")       
    end
  end
end
