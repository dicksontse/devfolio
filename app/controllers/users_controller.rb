class UsersController < ApplicationController
  before_action :signed_in_user,          only: [:edit, :update]
  before_action :correct_user,            only: [:edit, :update]
  before_action :skip_password_attribute, only: :update

  def show
    @user = User.friendly.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Dev List!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :name, :email, :location, 
                                   :website, :github, :welcome_section, 
                                   :about_section, :education_section, 
                                   :experience_section, :projects_section,
                                   :skills_section, :password, 
                                   :password_confirmation, :gravatar,
                                   :enable_welcome_section,
                                   :enable_about_section, 
                                   :enable_education_section, 
                                   :enable_experience_section, 
                                   :enable_projects_section, 
                                   :enable_skills_section)
    end

    # Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.friendly.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def skip_password_attribute
      if params[:password].blank? && params[:password_confirmation].blank?
        params.except!(:password, :password_validation)
      end
    end
end
