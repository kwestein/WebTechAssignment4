require 'test_helper'

class GenreTest < ActiveSupport::TestCase
  test "#create creates a genre" do
    assert_difference "Genre.count" do
      Genre.create(title: "New Genre")       
    end
  end
end
