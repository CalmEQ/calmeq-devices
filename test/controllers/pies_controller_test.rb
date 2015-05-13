require 'test_helper'

class PiesControllerTest < ActionController::TestCase
  
  # called before every test
  def setup 
    @py = pies(:two_py)
  end
  
  
  test "should get an index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pies)
  end
  
  test "should show a device" do
    get :show, id: @py.id
    assert_response :success
    assert_not_nil assigns(:py)
  end
  
  test "should create a device" do 
    assert_difference('Py.count') do
      post :create, py: { id: "testid1" };
    end
    
    assert_redirected_to py_path( assigns(:py) )
  end

#  test "should update device info" do
#    assert_equal("NewNote", @py.notes) do
#      patch :update, py: @py, id: @py.id, notes: "NewNote"
#    end
#  end
  
  # test "the truth" do
  #   assert true
  # end
end
