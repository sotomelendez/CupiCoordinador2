class MateriaController < ApplicationController
  def MostrarMateria
    if   params[:MateriaSeleccionada] != 'Seleccione una materia'  then
      @materia = materia.Find(params[:MateriaSeleccionada])
    end
  end

  def ContarMateriaPorSemestre
    @conteo = materia.count(:conditions => "id_semestre = #{params[:semeste]}" AND "id_materia = #{params[:materia]}")
  end

  def all
	@materias = materia.all
  end
end
