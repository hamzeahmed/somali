class PagesController < ApplicationController
  before_action :set_page , only: [:edit , :update , :destroy , :show]
  before_action :require_user , except: [:index , :show  , :home]
  before_action :require_same_user , only: [:edit , :update , :destroy]
  def show
    
  end
  def home
    redirect_to pages_path if logged_in?
  end
  def new
    @page = Page.new
  end
  
  def index
    @page = Page.all
  end
  
  def edit
    
  end

  def destroy
    
    @page.destroy
    flash[:danger] = "Article Was Successfully Deleted"
    redirect_to pages_path
    
  end
  
  def update
    #debugger
    if @page.update(page_parms)
      flash[:success] = "Article was Sucessfuly updated"
      redirect_to pages_path
    else
      render 'edit'
    end
  end
  
  def create
    @page = Page.new(page_parms)
    @page.user = current_user
    if @page.save
      flash[:success] = "Your Poet has Been Saved "
      redirect_to pages_path
    else    
      render 'new'
      
    end

  
    
  end
  
  private
    def page_parms
      params.require(:page).permit(:title , :description)
    end
    def set_page
      @page = Page.find(params[:id])
    end
    
    def require_same_user
      if current_user != @page.user and !current_user.admin?
        flash[:danger] = "Cidii Leh Uunbaa Wax Kabdali Karta"
        redirect_to root_path
      end
    end
end
