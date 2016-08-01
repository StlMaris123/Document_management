class DocumentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :index, :destroy]
 # before_action :correct_user, only: [:create, :edit, :update, :index, :destroy]
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
    if params[:department]
      @documents =Document.where("department = ?",params[:department])
    elsif params[:search]
      @documents = Document.search(params[:search])
    else
      @documents = Document.all
    end
  end


  def show
    @document = Document.find(params[:id])
  end

  def edit
    @document = Document.find(params[:id])
  end
   
  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(document_params)
      flash[:success] = "The document  was successfully updated"
      redirect_to documents_url
    else
      render 'edit'
    end 
  end

  private
  def document_params
    params.require(:document).permit(:title, :link, :tag, :department)
  end
end
