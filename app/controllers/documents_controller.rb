class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = "Your document was successfully added"
      redirect_to documents_url
    else
      render 'new'
    end
  end

  private
  def document_params
    params.require(:document).permit(:title, :link, :tag, :department)
  end
end
