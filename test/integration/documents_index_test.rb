require 'test_helper'

class DocumentsIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:stella)
    @document = documents(:one)
  end
  test "document indexing" do
    log_in_as(@user)
    get documents_path
    assert_template 'documents/index'
    assert_select 'a[href=?]', edit_document_path(@document)
    assert_select 'a[href=?]', document_path(@document), text: 'Delete Doc',
                                            mathod: :delete
  end
end
