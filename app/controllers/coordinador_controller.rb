class CoordinadorController < ApplicationController

def consolidado
@materias=Materia.order("nombre ASC").all
@semestres=Semestre.order("id_sem ASC").all

begin

if  !params[:fil1] and !params[:fil2]

@busqueda=EstudianteMateriaPeriodo.select("id_sem, id_materia,id_semestre,idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").group("id_semestre, id_materia").order("id_sem, nombre")
@cuentamaestrias=EstudianteMateriaPeriodo.select("id_maestria,codigo,nombre,count(*) as ct").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("join maestria on estudia.id_maestria=maestria.id").group("id_maestria")
@cuentaantiguos=Estudiante.select("id_estudiante,apellidos").joins("join estudiante_materia_periodos on estudiante_materia_periodos.id_estudiante=estudiantes.id")
@semantigu=@semestres.last.id_sem

elsif  !params[:fil1] and params[:fil2]
@semester=params[:consolidado][:semestre_id].to_i

@busqueda=EstudianteMateriaPeriodo.select("id_sem, id_materia,id_semestre,idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").group("id_semestre, id_materia").where("semestres.id=#{@semester}").order("nombre")
@cuentamaestrias=EstudianteMateriaPeriodo.select("id_maestria,codigo,nombre,count(*) as ct").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("join maestria on estudia.id_maestria=maestria.id").where("estudiante_materia_periodos.id_semestre=#{@semester}").group("id_maestria")
@cuentaantiguos=Estudiante.select("id_estudiante,apellidos").joins("join estudiante_materia_periodos on estudiante_materia_periodos.id_estudiante=estudiantes.id").where("estudiante_materia_periodos.id_semestre=#{@semester}")
@semantigu=Semestre.find(params[:consolidado][:semestre_id]).id_sem

elsif   params[:fil1] and !params[:fil2]

@busqueda=EstudianteMateriaPeriodo.select("id_sem, id_materia,id_semestre,idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_materia=?",params[:consolidado][:materia].to_i).group("id_semestre, id_materia").order("id_sem")
@cuentamaestrias=EstudianteMateriaPeriodo.select("id_maestria,codigo,nombre,count(*) as ct").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("join maestria on estudia.id_maestria=maestria.id").where("estudiante_materia_periodos.id_materia=?",params[:consolidado][:materia].to_i).group("id_maestria")
@cuentaantiguos=Estudiante.select("id_estudiante,apellidos").joins("join estudiante_materia_periodos on estudiante_materia_periodos.id_estudiante=estudiantes.id").where("estudiante_materia_periodos.id_materia=?",params[:consolidado][:materia].to_i)
@semantigu=@semestres.last.id_sem


elsif  params[:fil1] and params[:fil2]
@semester=params[:consolidado][:semestre_id].to_i
@busqueda=EstudianteMateriaPeriodo.select("id_sem, id_materia,id_semestre,idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_materia=#{params[:consolidado][:materia].to_i} AND estudiante_materia_periodos.id_semestre=#{params[:consolidado][:semestre_id].to_i}").group("id_semestre, id_materia").order("id_sem")
@cuentamaestrias=EstudianteMateriaPeriodo.select("id_maestria,codigo,nombre,count(*) as ct").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("join maestria on estudia.id_maestria=maestria.id").where("estudiante_materia_periodos.id_materia=#{params[:consolidado][:materia].to_i} AND estudiante_materia_periodos.id_semestre=#{params[:consolidado][:semestre_id].to_i}").group("id_maestria")
@cuentaantiguos=Estudiante.select("id_estudiante,apellidos").joins("join estudiante_materia_periodos on estudiante_materia_periodos.id_estudiante=estudiantes.id").where("estudiante_materia_periodos.id_materia=#{params[:consolidado][:materia].to_i} AND estudiante_materia_periodos.id_semestre=#{params[:consolidado][:semestre_id].to_i}")
@semantigu=Semestre.find(params[:consolidado][:semestre_id]).id_sem

end
rescue
puts "Error========================= #{$!}"

@busqueda=EstudianteMateriaPeriodo.select("id_sem, id_materia,id_semestre,idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").group("id_semestre, id_materia").order("id_sem, nombre")
@cuentamaestrias=EstudianteMateriaPeriodo.select("id_maestria,codigo,nombre,count(*) as ct").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiantes.id=estudia.id_estudiante").joins("join maestria on estudia.id_maestria=maestria.id").group("id_maestria")
@cuentaantiguos=Estudiante.select("id_estudiante,apellidos").joins("join estudiante_materia_periodos on estudiante_materia_periodos.id_estudiante=estudiantes.id")
@semantigu=@semestres.last.id_sem
end
end


def show_materia
@materias=Materia.order("nombre ASC").all
@semestres=Semestre.order("id_sem ASC").all
@porMateria=EstudianteMateriaPeriodo.select("id_sem, id_materia,idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_materia=?",params[:consolidado][:materia].to_i).group("id_semestre, id_materia").order("id_sem")
end

def show_semestre
@materias=Materia.order("nombre ASC").all
@semestres=Semestre.order("id_sem ASC").all
@semester=params[:consolidado][:semestre_id].to_i
@porSemestre=EstudianteMateriaPeriodo.select("id_sem, idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("semestres.id=#{@semester}").group("id_semestre, id_materia").order("nombre")
end

def show_materia_semestre
@materias=Materia.order("nombre ASC").all
@semestres=Semestre.order("id_sem ASC").all
@buscado=EstudianteMateriaPeriodo.select("id_sem, idu, nombre, count(*) as num_estud").joins("join materia on estudiante_materia_periodos.id_materia=materia.id").joins("join semestres on estudiante_materia_periodos.id_semestre=semestres.id").where("estudiante_materia_periodos.id_materia=#{params[:consolidado][:materia].to_i} AND estudiante_materia_periodos.id_semestre=#{params[:consolidado][:semestre_id].to_i}").group("id_semestre, id_materia").order("id_sem")
end

end
