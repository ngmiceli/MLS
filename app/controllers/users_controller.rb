class UsersController < ApplicationController
  before_filter :validate_params
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => [:index, :destroy]
  
  def index
    @title = "All Users"
    @users = User.paginate(:page => params[:page])
    @type = "general"
  end
  
  def welcome
    @user = User.find(params[:id])
    @type = "student"
      @title = @user.full_name
    if current_user != @user
      render 'show'
    end
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
      flash[:success] = "Welcome to MyLifeSpheres!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @title = @user.full_name
    @type = "student"
    @edit_page = params[:edit_page]
    do_education if @edit_page == "education"
    if @edit_page.nil?
      redirect_to "/users/" + params[:id] + "/myinfo/education"
    end
  end
  
  def show
    @user = User.find(params[:id])
    @type = "student"
    @title = @user.full_name
    @show_page = params[:show_page]
    @colleges = @user.college_profile.all
    @schools = @user.school_profile.all	
    if @show_page.nil?
      redirect_to "/users/" + params[:id] + "/show/education"
    end
  end
  
  def update
	@edit_page = "personal"
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
  
	def do_education
	  @colleges = @user.college_profile.all
	  @schools = @user.school_profile.all
	  @college = current_user.college_profile.build unless current_user.college_profile.count >= 3
	  @school = current_user.school_profile.build unless current_user.school_profile.count >= 3
	  @college_errors = session[:college_errors]
	  session[:college_errors] = nil
	  @school_errors = session[:school_errors]
	  session[:school_errors] = nil
	  store_location
	end
  
	def validate_params
	  if params[:id] != nil and params[:id].match(/^\d/)
	   raise ActionController::RoutingError.new('Not Found')
	  end
	end
      
	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_path) unless current_user?(@user)
	end
	
	def admin_user
	  redirect_to(root_path) unless current_user.admin?
	end
end
