class SchoolProfilesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user,  only: :destroy
  
  def create
    @school = current_user.school_profile.build(params[:school_profile])
    if @school.save
      flash[:success] = "High School created"
    else
      session[:school_errors] = @school.errors.full_messages
    end
    redirect_back_or(current_user)
  end
  
  def destroy
    @school.destroy
    redirect_back_or current_user
  end
  
  private
  
    def correct_user
      @school = current_user.school_profile.find_by_id(params[:id])
      redirect_to current_user if @school.nil?
    end
  
end
