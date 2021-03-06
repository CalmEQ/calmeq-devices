require 'test_helper'

class ReadingsControllerTest < ActionController::TestCase
  def setup
    @reading = readings(:one)
  end
    
  test "should show a reading" do
    get :show, id: @reading.id, py_id: @reading.py_id
    assert_response :success
    assert_not_nil assigns(:reading)
    assert_not_nil assigns(:py)
  end
  
  test "should get an index" do
    get :index, py_id: @reading.py_id
    assert_response :success
    assert_not_nil assigns(:readings)
  end

  test "create a reading" do
    assert_difference('Reading.count') do
      post :create, py_id: @reading.py_id, reading: {id: "testreading2", lat: 201, lon: 10, dblvl: 23.42, identifier: "newmacaddress" };
    end
    @newreading = Reading.find_by( dblvl: 23.42 )
    @py = Py.find(@newreading.py_id)
    
    assert_redirected_to py_reading_path(@py, @newreading)
  end
  
  

  # test "the truth" do
  #   assert true
  # end
end
