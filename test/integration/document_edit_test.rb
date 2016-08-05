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
end
