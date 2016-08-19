class DocumentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :show, :index, :destroy]
  before_action :correct_user, only: [ :edit, :update,  :destroy]
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
    @document = current_user.documents.find_by(id: params[:id])

  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find_by(id: params[:id])
    if @document.update_attributes(document_params)
      flash[:success] = "The document  was successfully updated"
      redirect_to documents_url
    else
      render 'edit'
    end 
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:success] = "the document \" #{@document.title}\" was deleted"
    redirect_to current_user
    
  end

  private
  def document_params
    params.require(:document).permit(:title, :link, :tag, :department,  :user_id)
  end


  def correct_user
    @document = current_user.documents.find_by(id: params[:id])
    redirect_to(root_url) unless @document
  end

 def logged_in_user
    unless logged_in?
      store_location
      flash[:alert] = "Please log in first" 
      redirect_to login_url
    end
  end
end
