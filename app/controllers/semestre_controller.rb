class SemestreController < ApplicationController

def new
@estud=Estudiante.all.where(:stud_id => params[:semestre][:cod_stud]).limit(1)
@estud.each do |est|
@id_estudiante=est.id
end
@registro=EstudianteMateriaPeriodo.new(:id_estudiante=>@id_estudiante, :id_materia=>params[:semestre][:materia],:id_semestre=>params[:semestre][:semestre_id])
@registro.save
redirect_to :action => 'verpensum', :controller=>'estudiante',  :params => { :pensum =>{:cod_stud => params[:semestre][:cod_stud]}}
end

def show
@estud=Estudiante.all.where(:stud_id => params[:semestre][:cod_stud]).limit(1)
@estud.each do |est|
@id_estud=est.id
end
@semester=EstudianteMateriaPeriodo.select("id_sem, idu, nombre").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_estudiante=#{@id_estud} AND estudiante_materia_periodos.id_semestre=#{params[:semestre][:semestre_id]}")
end

end
