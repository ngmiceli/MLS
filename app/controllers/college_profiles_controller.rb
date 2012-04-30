class CollegeProfilesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,  only: :destroy
  
  def create
    @college = current_user.college_profile.build(params[:college_profile])
    if @college.save
      flash[:success] = "College created"
    else
      session[:college_errors] = @college.errors.full_messages
    end
    redirect_back_or(current_user)
  end
  
  def destroy
    @college.destroy
    redirect_back_or current_user
  end
  
  private
  
    def correct_user
      @college = current_user.college_profile.find_by_id(params[:id])
      redirect_to current_user if @college.nil?
    end
  
end
