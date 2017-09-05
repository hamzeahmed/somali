require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "John" , email: "john@example.com" , password: "123" , admin: true)
  end
  
  test "should get create form and create" do
    sign_in_as(@user , "123")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count' , 1 do
      post_via_redirect categories_path , category: {name: "sport"}
    end
    assert_template 'categories/index'
    assert_match "sport" , response.body
  end
  
  test "invalid category submission failure" do
    sign_in_as(@user , "123")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path ,category: {name: " "}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
end