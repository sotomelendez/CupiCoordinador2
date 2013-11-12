require 'test/unit'

class Reservas < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Cupos de pregrado
  def test_pregrado
    aspirantesPregrado = 4
    tot = ReservarPregrado(1)
    assert_equal(tot, aspirantesPregrado)
  end

  # Cupos de otro programa
  def test_otro_programa
    aspirantesOtro = 6
    tot = ReservarOtroPrograma(1)
    assert_equal(tot, aspirantesOtro)
  end

  # Cupos del programa
  def test_programa
    aspirantesPrograma = 10
    tot = ReservarPrograma(1)
    assert_equal(tot, aspirantesPrograma)
  end
end