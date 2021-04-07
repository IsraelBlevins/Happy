require 'test_helper'

class HomeworkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get homework_index_url
    assert_response :success
  end

end
