class ConsolidadoController < ApplicationController
  def list
   
     @consolidado = Materia.find(:all)
  end

  def create
  end

  def update
    puts 2
      @consolidado = EstudianteMateriaPeriodo.find(:all)
  end

  def edit
  end

  def destroy
    puts 3
      @consolidado = EstudianteMateriaPeriodo.find(:all)
  end

  def index
   
    @consolidado = EstudianteMateriaPeriodo.find(:all)
  
  end

  def show
    puts 5
      @consolidado = EstudianteMateriaPeriodo.find(:all)
       
  end
end
