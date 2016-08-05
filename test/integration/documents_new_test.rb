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
    assert_difference 'Document.count', 1 do
      post documents_path, params: { document: { title: "Love Affairs",
                                                 tag: "Love",
                                                 link: "https://www.love.com",
                                                 department: "Finance"

      }

      }
    end
    assert_redirected_to documents_url
    assert_not flash.empty?
  end
end
