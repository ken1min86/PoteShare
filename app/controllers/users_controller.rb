class UsersController < ApplicationController
  before_action :login_required, only: %i[edit update show profile change_profile]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Welcome! You have signed up successfully.'
      session[:user_id] = @user.id
      redirect_to users_profile_path
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: current_user.id)
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
    @user = User.find_by(id: current_user.id)

    if params[:user][:password].empty? && params[:user][:password_confirmation].empty?
      params[:user][:password] = params[:user][:password_now]
      params[:user][:password_confirmation] = params[:user][:password_now]
      if @user&.authenticate(params[:user][:password_now])
        if @user.update(user_params_for_update_email_and_password)
          flash[:notice] = 'Email was successfully updated.'
          redirect_to users_account_path and return
        else
          set_email_and_render_to_account_edit and return
        end

      else
        @user.errors.add(:password_now, ' is invalid')
        set_email_and_render_to_account_edit and return
      end

    else

      if @user&.authenticate(params[:user][:password_now])
        if @user.update(user_params_for_update_email_and_password)
          flash[:notice] = 'Email and Password was successfully updated.'
          redirect_to users_account_path and return
        end
      else
        @user.errors.add(:password_now, ' is invalid')
        unless params[:user][:password] == params[:user][:password_confirmation]
          @user.errors.add(:password, " doesn't match Password")
          @user.errors.add(:password_confirmation, " doesn't match Password")
        end
      end

      set_email_and_render_to_account_edit and return
    end
  end

  def profile
    @user = User.find_by(id: current_user.id)
  end

  def change_profile
    @user = User.find_by(id: current_user.id)
    @user.assign_attributes(user_params_for_change_profile)
    if @user.save(context: :change_profile)
      flash[:notice] = 'Profile was successfully updated.'
      redirect_to users_profile_path
    else
      render :profile
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :user_img, :email, :password, :password_confirmation)
  end

  def user_params_for_update_email_and_password
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def user_params_for_update_email
    params.require(:user).permit(:email)
  end

  def set_email_and_render_to_account_edit
    @user.email = params[:user][:email]
    render :edit
  end

  def user_params_for_change_profile
    params.require(:user).permit(:user_img, :username, :introduction)
  end
end
