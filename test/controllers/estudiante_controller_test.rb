require 'test_helper'

class EstudianteControllerTest < ActionController::TestCase
  test "should get semestre tentativo" do
    get :semtent
    assert_response :success
  end

  test "should get pensum" do
    get :verpensum
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
