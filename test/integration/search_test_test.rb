require 'test_helper'

class SearchTestTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
    @document = documents(:one)
  end
  test "search for documents which returns valid results " do
    log_in_as(@user)
    #search by title
    get documents_path,params: { "search" => { :title => @document.title, :link => @document.link, :tag => @document.tag }}
    assert_response :success
  end
end
