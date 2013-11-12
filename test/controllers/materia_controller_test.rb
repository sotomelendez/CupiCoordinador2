require 'test_helper'

class MateriaControllerTest < ActionController::TestCase
 test "should get materia Mostrada" do
    get :MostrarMateria
    assert_response :success
  end

  test "should get by materia contada por semestre" do
    get :ContarMateriaPorSemestre
    assert_response :success
  end

  test "should get all" do
    get :all
    assert_response :success
  end



end
