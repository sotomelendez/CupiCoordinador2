class CoordinadorController < ApplicationController

def consolidado
@materias=Materia.order("nombre ASC").all
@semestres=Semestre.order("id_sem ASC").all
@busqueda=EstudianteMateriaPeriodo.select("id_sem, idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").group("id_semestre, id_materia").order("id_sem, nombre").group("id_sem, idu, nombre")
end

def show_materia
@materias=Materia.order("nombre ASC").all
@semestres=Semestre.order("id_sem ASC").all
@porMateria=EstudianteMateriaPeriodo.select("id_sem, idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_materia=?",params[:consolidado][:materia].to_i).group("id_semestre, id_materia").order("id_sem").group("id_sem, idu, nombre")
end

def show_semestre
@materias=Materia.order("nombre ASC").all
@semestres=Semestre.order("id_sem ASC").all
@semester=params[:consolidado][:semestre_id].to_i
@porSemestre=EstudianteMateriaPeriodo.select("id_sem, idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("semestres.id=#{@semester}").group("id_semestre, id_materia").order("nombre").group("id_sem, idu, nombre")
end

def show_materia_semestre
@materias=Materia.order("nombre ASC").all
@semestres=Semestre.order("id_sem ASC").all
@buscado=EstudianteMateriaPeriodo.select("id_sem, idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_materia=#{params[:consolidado][:materia].to_i} AND estudiante_materia_periodos.id_semestre=#{params[:consolidado][:semestre_id].to_i}").group("id_semestre, id_materia").order("id_sem").group("id_sem, idu, nombre")
end

end
