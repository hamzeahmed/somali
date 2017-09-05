require  'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create(name: "sport")
    @user = User.create(username: "John" , email: "john@example.com" , password: "123" , admin: true)
  end
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get categories new" do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test "should get categories show" do
    
    get(:show , {'id' => @category.id}) 
    assert_response :success
  end
  
  test "should get categories edit" do
    session[:user_id] = @user.id
    get(:edit , {'id' => @category.id}) 
    assert_response :success
  end
  
  test "should redirect create when admin not logged_in " do
    assert_no_difference 'Category.count' do
      post :create , category: {name: "sports"}
    end
    assert_redirected_to categories_path
  end
  
end