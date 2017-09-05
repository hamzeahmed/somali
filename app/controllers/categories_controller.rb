class CategoriesController < ApplicationController 

  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def show
    
  end
  
  def edit
    
  end
  def create
    @category = Category.new(category_prams)
    if @category.save
      flash[:success] = "New Category Is Added To The List"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  private
    def category_prams
      params.require(:category).permit(:name)
    end
    
    def require_same_user
      if current_user != @page.user and !current_user.admin?
        flash[:danger] = "Cidii Leh Uunbaa Wax Kabdali Karta"
        redirect_to root_path
      end
    end
end