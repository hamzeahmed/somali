require  'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = Category.create(name: "sport")
  end
  test "should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get categories new" do
    get :new
    assert_response :success
  end
  
  test "should get categories show" do
    
    get(:show , {'id' => @category.id}) 
    assert_response :success
  end
  
  test "should get categories edit" do
    get(:edit , {'id' => @category.id}) 
    assert_response :success
  end
  
end