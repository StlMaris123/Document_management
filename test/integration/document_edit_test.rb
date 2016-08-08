require 'test_helper'

class DocumentEditTest < ActionDispatch::IntegrationTest
  def setup
    @document = documents(:one)
    @user = users(:stella)
  end
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_document_path(@document)
    assert_template 'documents/edit'
    patch document_path(@document), params: { document:{ title: "",
                                                         tag: "",
                                                         link: "zxcvbbnm",
                                                         department: ""

    }
    }
    assert_template 'documents/edit'
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_document_path(@document)
    assert_template 'documents/edit'
    title      = "A Scanner Darkly"
    tag        = "Speech"
    link       = "http://bogisichdurgan.io/israel"
    department = "Credit"
    patch document_path(@document),params: { document: { title: title,
                                                         tag: tag,
                                                         link: link, 
                                                         department: department} }
    assert_not flash.empty?
    assert_redirected_to documents_url
    @document.reload
    assert_equal @document.title, title
    assert_equal @document.tag, tag
    assert_equal @document.link, link
    assert_equal @document.department, department
  end
end
