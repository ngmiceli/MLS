class PagesController < ApplicationController

  def home
    if signed_in?
      redirect_to current_user
    else
      @title = "Home"
      @type = "general"
    end
  end

  def contact
    @title = "Contact"
    @type = "general"
  end

  def about
    @title = "About"
    @type = "general"
  end
  
  def help
    @title = "Help"
    @type = "general"
  end
end