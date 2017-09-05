class  SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #debugger
      session[:user_id] = user.id 
      flash[:success] = "Welcome To The Users " 
      redirect_to user_path(user)
    else
      flash.now[:danger] = "There Is Some Thing Wrong " 
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You Logout"
    redirect_to root_path
    
  end
  
end