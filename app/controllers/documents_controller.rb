class DocumentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :index, :destroy]
  before_action :correct_user, only: [:create, :edit, :update, :index, :destroy]
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

  def index
    @documents = Document.all
  end

  private
  def document_params
    params.require(:document).permit(:title, :link, :tag, :department)
  end
end
