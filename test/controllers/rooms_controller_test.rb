require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get rooms_show_url
    assert_response :success
  end

  test "should get index" do
    get rooms_index_url, as: :json
    json = JSON.parse(response.body)

    assert_equal 10, json['id']

    expected = {'id' => 1, 'content' => 'hey'}
    assert_equal expected, json['messages'][0]
  end
end
