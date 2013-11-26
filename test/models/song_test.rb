require 'test_helper'

class SongTest < ActiveSupport::TestCase
  test "#create creates a song" do
    assert_difference "Song.count" do
      Song.create(title: "New Song")       
    end
  end
end
