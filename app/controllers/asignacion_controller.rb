class AsignacionController < ApplicationController
  def seleccionar
  @materias=Materia.order("idu ASC").all
  @semestres=Semestre.order("id_sem ASC").all
  end
  
  def resultado
    @materia=Materia.find(params[:asign][:materia])
	@semestre=Semestre.find(params[:asign][:semestre_id])
	@cupos=Cupos.select("num_cupos").where("id_materia=#{params[:asign][:materia]}")
	@asigna = Asignacion.select("count(*) as cuenta").where("id_materia=#{params[:asign][:materia]} AND id_semestre=#{params[:asign][:semestre_id]}")
	if @asigna.first.cuenta==0
		redirect_to :action => 'ReservarPrograma',  :params => { :semestre => @semestre.id, :materia => @materia.id, :cupos => @cupos.first.num_cupos }
	else
		redirect_to :action => 'show',  :params => { :semestre => @semestre.id, :materia => @materia.id }
	end
  end
  
  def ReservarPrograma
	@estuds = EstudianteMateriaPeriodo.select("estudiantes.id as id, name").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiante_materia_periodos.id_estudiante=estudia.id_estudiante").joins("join materia_maestria on estudiante_materia_periodos.id_materia=materia_maestria.id_materia").where("estudiante_materia_periodos.id_materia=#{params[:materia]} AND estudiante_materia_periodos.id_semestre=#{params[:semestre]} AND estudia.id_maestria=materia_maestria.id_maestria").order("random()").limit((params[:cupos].to_i*0.5).to_i)
	@estuds.each do |est|
		@asignado = Asignacion.new(:id_materia => params[:materia].to_i, :id_estudiante => est.id, :id_semestre => params[:semestre].to_i)
		@asignado.save
	end
	redirect_to :action => 'ReservarOtroPrograma',  :params => { :semestre => params[:semestre], :materia => params[:materia], :cupos => params[:cupos] }
  end
  
  def ReservarPregrado
	@estuds = EstudianteMateriaPeriodo.select("estudiantes.id as id, name").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiante_materia_periodos.id_estudiante=estudia.id_estudiante").joins("join materia_maestria on estudiante_materia_periodos.id_materia=materia_maestria.id_materia").where("estudiante_materia_periodos.id_materia=#{params[:materia]} AND estudiante_materia_periodos.id_semestre=#{params[:semestre]} AND estudia.id_maestria=1").order("random()").limit((params[:cupos].to_i*0.2).to_i)
	@estuds.each do |est|
		@asignado = Asignacion.new(:id_materia => params[:materia].to_i, :id_estudiante => est.id, :id_semestre => params[:semestre].to_i)
		@asignado.save
	end
	redirect_to :action => 'show', :params => { :semestre => params[:semestre], :materia => params[:materia] }
  end
  
  def ReservarOtroPrograma
	@estuds = EstudianteMateriaPeriodo.select("estudiantes.id as id, name").joins("join estudiantes on estudiante_materia_periodos.id_estudiante=estudiantes.id").joins("join estudia on estudiante_materia_periodos.id_estudiante=estudia.id_estudiante").joins("join materia_maestria on estudiante_materia_periodos.id_materia=materia_maestria.id_materia").where("estudiante_materia_periodos.id_materia=#{params[:materia]} AND estudiante_materia_periodos.id_semestre=#{params[:semestre]} AND estudia.id_maestria<>materia_maestria.id_maestria AND estudia.id_maestria<>1").order("random()").limit((params[:cupos].to_i*0.3).to_i)
	@estuds.each do |est|
		@asignado = Asignacion.new(:id_materia => params[:materia].to_i, :id_estudiante => est.id, :id_semestre => params[:semestre].to_i)
		@asignado.save
	end
	redirect_to :action => 'ReservarPregrado', :params => { :semestre => params[:semestre], :materia => params[:materia], :cupos => params[:cupos] }
  end
  
  def show
	@materia=Materia.find(params[:materia].to_i)
	@semestre=Semestre.find(params[:semestre].to_i)
	@resultado = Asignacion.select("estudiantes.name as name, estudiantes.stud_id as stud_id, maestria.codigo as cod_maest, maestria.nombre as maest").joins("join estudiantes on asignacions.id_estudiante=estudiantes.id").joins("join estudia on asignacions.id_estudiante=estudia.id_estudiante").joins("join maestria on estudia.id_maestria=maestria.id").where("asignacions.id_materia=#{params[:materia].to_i} AND asignacions.id_semestre=#{params[:semestre].to_i}").order("maest, stud_id")
  end
end
