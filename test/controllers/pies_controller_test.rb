require 'test_helper'
require 'pry'

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

  test "should show a new form" do
    get :new
    assert_response :success
  end

  test "should update device info" do
    puts 'inside device info'
    patch :update, id: @py.id, py: { notes: "NewNote" }#@py
    assert_equal("NewNote", @py.reload.notes)
    assert_redirected_to py_path(@py)
  end
  
  test "should destory a device" do 
    py_gone = pies(:py_gone)
    assert_difference('Py.count', -1) do
      delete :destroy, id: py_gone.id
    end
    
    assert_redirected_to pies_path
  end

  # test "the truth" do
  #   assert true
  # end
end
