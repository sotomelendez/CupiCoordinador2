require 'test_helper'

class AsignacionControllerTest < ActionController::TestCase
  test "should get seleccionar" do
    get :seleccionar
    assert_response :success
  end
  
  test "should get resultado" do
    get :resultado
    assert_response :success
  end
  
  test "should get ReservarPrograma" do
    get :ReservarPrograma
    assert_response :success
  end
  
  test "should get ReservarOtroPrograma" do
    get :ReservarOtroPrograma
    assert_response :success
  end
  
  test "should get ReservarPregrado" do
    get :ReservarPregrado
    assert_response :success
  end
end
