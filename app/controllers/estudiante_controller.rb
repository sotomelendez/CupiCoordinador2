class EstudianteController < ApplicationController

def semtent
@materias=Materia.all
@semestres=Semestre.all
end

def verpensum
@estud=Estudiante.all.where(:stud_id => params[:pensum][:cod_stud]).limit(1)
@estud.each do |est|
@id_estud=est.id
@cdest = params[:pensum][:cod_stud]
@prg = Estudiante.select("stud_id,codigo,nombre").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("join maestria on estudia.id_maestria=maestria.id").where("stud_id=#{params[:pensum][:cod_stud]}")
end
@pensum=EstudianteMateriaPeriodo.select("id_sem, idu, nombre").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_estudiante=#{@id_estud}").order("id_sem")
@semestres= EstudianteMateriaPeriodo.select("id,id_sem, count(*)").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_estudiante=#{@id_estud}").group("id_sem")
@materias=Materia.order("idu ASC").all
@semestres=Semestre.order("id_sem ASC").all
end

end
