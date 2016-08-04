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


end
