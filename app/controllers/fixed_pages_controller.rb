class FixedPagesController < ApplicationController
  def home
    if logged_in?
    @document = current_user.documents
    end
  end

  def about
  end

  def help
  end

  def contact
  end
end
