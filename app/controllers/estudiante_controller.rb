class EstudianteController < ApplicationController

def semtent
@materias=Materia.all
@semestres=Semestre.all
end

def verpensum
@estud=Estudiante.all.where(:stud_id => params[:pensum][:cod_stud]).limit(1)
@estud.each do |est|
@id_estud=est.id
end
@pensum=EstudianteMateriaPeriodo.select("id_sem, idu, nombre").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_estudiante=#{@id_estud}").order("id_sem")
end

end
