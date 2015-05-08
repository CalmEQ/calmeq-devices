require 'test_helper'

class PiesControllerTest < ActionController::TestCase
  
  test "should get an index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pies)
  end
  
  test "should create a device" do 
    assert_difference('Py.count') do
      post :create, py: { id: "testid1" };
    end
    
    assert_redirected_to py_path( assigns(:py) )
  end

  # test "the truth" do
  #   assert true
  # end
end
