require 'test_helper'

class DocumentsNewTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
  end
  test "unsuccessful document creation" do
    log_in_as(@user)
    get new_document_path
    assert_template 'documents/new'
    assert_no_difference 'Document.count' do
      post documents_path, params: { document: { title: "",
                                                 tag: "",
                                                 link: "",
                                                 department: ""} } 
    end
    assert_template 'documents/new'
  end
  test "successful document creation" do
    log_in_as(@user)
    get new_document_path
    assert_template 'documents/new'
    document_params = {
      title: "Love matters",
      tag: "Love",
      link: "http://www.love.com",
      department: "Credit",
      user_id: @user.id

    }

    assert_difference 'Document.count', 1 do
      post documents_path, params: { document: document_params }
    end
    assert_redirected_to documents_url
    assert_not flash.empty?
  end
end
