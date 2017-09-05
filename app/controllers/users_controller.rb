class UsersController < ApplicationController
  before_action :set_user ,only: [:edit , :update ,:destroy ,:show ]
  before_action :require_same_user , only: [:edit , :update]
  before_action :require_admin, only: [:destroy]
  
  def index
    @user = User.all
  end
  def home
    redirect_to root_path 
  end
  def new
    @user =User.new
  end
  def show
    
  end
  def create
    #debugger
    @user = User.new(user_prams)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome User " "#{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def update
    if @user.update(user_prams)
      flash[:success] = "The User Is Updated "
      redirect_to users_path
    else
      render 'new'
    end
    
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by user have been deleted"
    redirect_to users_path

end
  private
    def user_prams
      params.require(:user).permit(:username , :email , :password)
    end
    def set_user
      @user = User.find(params[:id])
    end
    def require_same_user
      if current_user != @user
        flash[:danger] = "You can Edit Ony Your Profile"
        redirect_to root_path
      end
    end
    def require_admin
      if logged_in and !current_user.admin
       flash[:danger] = "Only admin users can perform that action"
       redirect_to root_path
      end
    end
end