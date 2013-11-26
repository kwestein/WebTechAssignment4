require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test 'a user should get index' do
    get :index

    assert_response :ok
  end
end
