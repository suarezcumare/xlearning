class Modulo < ActiveRecord::Base
  belongs_to :curso
  has_many :contenidos
  has_many :objeto_aprendizajes, :through => :contenido
  has_many :evaluacions
  has_many :asignacions


  def porcentajeCurso(id)


  		@grupo = Grupo.where("id = ?", id)

			@grupo.each do |grupo|
				@grupo = grupo
			end

			end_date = Date.parse @grupo.fecha_fin.to_s
			start_date =  Date.parse @grupo.fecha_inicio.to_s 
			actual = (Date.today - start_date).to_i
			total = (end_date - start_date).to_i

	 	@porcentaje = actual.to_i * 100 / total.to_i
	
	 if @porcentaje <= 0
		return 0
	 else
	 	return @porcentaje
	 end
  end


  def porcentajeModulo(id, modulo_id)

  				@evaluaciongrupos = EvaluacionGrupo.includes(:grupo).where("grupo_id = ?", id)

			@evaluaciongrupos.each do |eva|
				@eval = eva
			end

			@modulo = Modulo.includes(:curso).where("curso_id = ? and modulos.id = ?", @eval.grupo.curso.id, modulo_id).order("orden ASC").limit(1)

			@porcentajemodulo = 100 
			@totalEvaluacionesPresentadas = 0
			@totalAsingancionesPresentadas = 0
			@porcentaje = 0
			@countEvaluaciones = 0
			@countAsignaciones = 0

			@modulo.each do  |modulo|
    
			      modulo.evaluacions.each do |evaluacion| 
				       @contadorEvaluacion = 0

				       @evaluaciongrupos = EvaluacionGrupo.includes(:evaluacion).where("grupo_id = ? and evaluacion_id = ?",id, evaluacion.id ).order('fecha_habilitacion ASC').limit(1) 
				       @countEvaluaciones =  @evaluaciongrupos.count + 1
				      	
				      	 @evaluaciongrupos.each do |grupoevaluacion| 
				      	 	
				      	 	 @evaluacionpresentada = EvaluacionPresentada.where("evaluacion_grupo_id = ?", grupoevaluacion.id).order("fecha_presentacion DESC").limit(1) 

			                 @evaluaciones = EvaluacionPresentada.new 

			                @evaluacionpresentada.each do |evaluacionpresentada| @evaluaciones = evaluacionpresentada end  

	                          if ! @evaluaciones.puntuacion.nil? and  @evaluaciones.puntuacion != 0
	                          		 @contadorEvaluacion  = @contadorEvaluacion + 1   
	                          end

				      	  end

				 	 		@totalEvaluacionesPresentadas = @totalEvaluacionesPresentadas + @contadorEvaluacion
				 	 		
				 	  end 


			     modulo.asignacions.each do |asignacion| 
			       	@contadorAsingnacion = 0
				      
			       		  @asignaciongrupos = AsignacionGrupo.includes(:asignacion).where("grupo_id = ? and asingnacion_id = ?",id, asingnacion.id ).order('fecha_habilitacion ASC').limit(1) 
				      		@countAsignaciones =  @asignaciongrupos.count + 1
				      		
				      		 @asignaciongrupos.each do |grupoasingnacion| 

				      	 	 @asingnacionpresentada = AsignacionPresentada.where("asingnacion_grupo_id = ?", grupoasingnacion.id).order("fecha_presentacion DESC").limit(1) 

			                 @asingnaciones = AsignacionPresentada.new 

			                @asingnacionpresentada.each do |asingnacionpresentada| @asingnaciones = asingnacionpresentada end  

	                          if ! @asingnaciones.puntuacion.nil?
	                          		 @contadorAsingnacion  = @contadorAsingnacion + 1   
	                          end

				      	  end



				 	 		@totalAsingancionesPresentadas = @totalAsingancionesPresentadas + @contadorAsingnacion
			  	 end

			  	 if ( @countAsignaciones + @countEvaluaciones ) <= 0
			  	 	@porcentaje = @porcentaje + 0
			  	  else	
			  			@porcentaje = @porcentaje +  (@totalAsingancionesPresentadas  + @totalEvaluacionesPresentadas ) * ( @porcentajemodulo ) / ( @countAsignaciones + @countEvaluaciones )
			  	 end
			 end 

			 
	return @porcentaje
  	
  end


		 def duracion_curso(id)

		 	@grupo = Grupo.where("id = ?", id)

			@grupo.each do |grupo|
				@grupo = grupo
			end

			end_date = Date.parse @grupo.fecha_fin.to_s
			start_date =  Date.parse @grupo.fecha_inicio.to_s 
			
			total = (end_date - start_date).to_i

	 	@porcentaje = total
	
	 if @porcentaje <= 0
		return 0
	 else
	 	return @porcentaje
	 end

		 end


end
