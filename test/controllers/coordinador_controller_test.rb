require 'test_helper'

class CoordinadorControllerTest < ActionController::TestCase
 test "should get consolidado" do
    get :consolidado
    assert_response :success
  end

  test "should get by materia" do
    get :show_materia
    assert_response :success
  end

  test "should get by semestre" do
    get :show_semestre
    assert_response :success
  end

  test "should get by materia and semestre" do
    get :show_materia_semestre
    assert_response :success
  end

end
