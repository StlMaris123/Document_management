require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
  end
  test "should get new" do
    log_in_as(@user)
    get new_document_url
    assert_response :success
  end

end
