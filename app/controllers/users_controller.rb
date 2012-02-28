class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page])
    @type = "general"
  end
  
  def welcome
    @user = User.find(params[:id])
    @type = "student"
      @title = @user.name
    if current_user != @user
      render 'show'
    end
    #@microposts = @user.microposts.paginate(:page => params[:page])
  end
  
  def new
    @user = User.new
    @title = "Sign up"
    @type = "general"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
	  sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
	@title = @user.name
	@type = "student"
	@edit_page = params[:edit_page]
	if @edit_page.nil?
	  redirect_to "/users/" + params[:id] + "/myinfo/personal"
	end
  end
  
  def show
    @user = User.find(params[:id])
    @type = "student"
    @title = @user.name
    @show_page = params[:show_page]
    if @show_page.nil?
      redirect_to "/users/" + params[:id] + "/show/personal"
    end
  end
  
  def update
	if @user.update_attributes(params[:user])
		flash[:success] = "Profile updated."
		redirect_to @user
	else
		@title = "Edit user"
		@type = "student"
		render 'edit'
	end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:sucess] = "User destroyed."
    redirect_to users_path
  end
  
  private
	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_path) unless current_user?(@user)
	end
	
	def admin_user
	  redirect_to(root_path) unless current_user.admin?
	end
end
