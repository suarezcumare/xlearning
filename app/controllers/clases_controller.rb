class ClasesController < ApplicationController
	before_action :authenticate_usuario!
	def index
		if current_usuario.rol_actual.id == 1

				@grupo = Grupo.where("id = ? and usuario_id = ?", params[:id], current_usuario.id).limit(1)
			
				if  @grupo.count > 0
						@evaluaciongrupos = EvaluacionGrupo.includes(:grupo).where("grupo_id = ?", params[:id])

							@evaluaciongrupos.each do |eva|
								@eval = eva
							end

							  facilitador_id = @eval.grupo.curso.facilitador_id
							  @facilitador = Usuario.where("id = ?", facilitador_id)

							@facilitador.each do |facilitador|
								@facilitador = facilitador
							end
					
							@modulo = Modulo.includes(:curso).where("curso_id = ?", @eval.grupo.curso.id).order("sorden ASC")


				@usuredes = UsuarioRedSocial.includes(:red_social).where("usuario_id = ?", @facilitador.id)


							render '/clases/index'
				else
				    render "portal/index_estudiante"
				end

		else
			render "/clases/calendario_facilitador"
		end
	end

		def estudiante
			render "/estudiante/index"
		end

		def nuevo_material 
		end	

		def calendario_facilitador
			render "/clases/calendario_facilitador"
		end	


		

		def generarClasesNotificacionesEvaluaciones

		numero 	= params[:number]

					
					@evaluaciongrupos = EvaluacionGrupo.includes(:evaluacion).where("grupo_id = ?", numero).order('fecha_habilitacion ASC').limit(2)

					@son2 = @evaluaciongrupos.count

				if @son2 > 0 
				    @i2=1
				    $tirajson2 = '[ '
				 @evaluaciongrupos.each do |evaluaciongrupo|
				      	if @i2<@son2

							$tirajson2 = $tirajson2 +   ' { "nombre": "'  + evaluaciongrupo.evaluacion.titulo.to_s + 
														'","descripcion": "'+ evaluaciongrupo.evaluacion.descripcion.to_s +
														'","fecha": "'+ 	evaluaciongrupo.fecha_habilitacion.to_formatted_s(:db).to_s +
														'","url": "'  "/clases/"+1.to_s+"/evaluacion/"+evaluaciongrupo.id.to_s+"/overview" +  '"}, '
				        else
							 $tirajson2 = $tirajson2 +   ' { "nombre": "'  + evaluaciongrupo.evaluacion.titulo.to_s + 
														'","descripcion": "'+ evaluaciongrupo.evaluacion.descripcion.to_s +
														'","fecha": "'+ 	evaluaciongrupo.fecha_habilitacion.to_formatted_s(:db).to_s +
														'","url": "'  "/clases/"+1.to_s+"/evaluacion/"+evaluaciongrupo.id.to_s+"/overview" +  '"} '
				      end
				    		@i2=@i2+1
				  end
				   	 $tirajson2 = $tirajson2 + ' ]'
			   else
			    $tirajson2 = '[ ]'; 
			   end
			   
			  		render :json => $tirajson2 
		

		end

		def generarClasesNotificacionesDiscuciones

			numero 	= params[:number]

				@mensaje = Mensaje.where("grupo_id = ?", numero).order("publicado DESC").limit(2)

					@son2 = @mensaje.count

				if @son2 > 0 
				    @i2=1
				    $tirajson2 = '[ '
				 @mensaje.each do |mensaje|
				      	if @i2<@son2

							$tirajson2 = $tirajson2 +   ' { "usuario": "'  + mensaje.usuario.nombre.to_s + " "+ mensaje.usuario.apellido.to_s + 
														'","nombre": "'+ mensaje.titulo.to_s +
														'","fecha": "'+ 	mensaje.publicado.to_formatted_s(:db).to_s +
														'","url": "'  "/mensaje/"   + mensaje.id.to_s +  '"}, '
				        else
							 $tirajson2 = $tirajson2 +   ' { "usuario": "' + mensaje.usuario.nombre.to_s + " "+ mensaje.usuario.apellido.to_s +
														'","nombre": "'+ mensaje.titulo.to_s +
														'","fecha": "'+ 	mensaje.publicado.to_formatted_s(:db).to_s +
														'","url": "'  "/mensaje/"   + mensaje.id.to_s +  '"} '
				      end
				    		@i2=@i2+1
				  end
				   	 $tirajson2 = $tirajson2 + ' ]'
			   else
			    $tirajson2 = '[ ]'; 
			   end
			   
			  		render :json => $tirajson2 


		end

		def generarClasesNotificaciones

		numero 	= params[:number]

				@mensaje = Mensaje.where("grupo_id = ?", numero).order("publicado DESC").limit(5)

					@son2 = @mensaje.count

				if @son2 > 0 
				    @i2=1
				    $tirajson2 = '[ '
				 @mensaje.each do |mensaje|
				      	if @i2<@son2

							$tirajson2 = $tirajson2 +   ' { "usuario": "' + mensaje.usuario.nombre.to_s + " "+ mensaje.usuario.apellido.to_s +
														'","nombre": "'+ mensaje.titulo.to_s +
														'","descripcion": "'+ mensaje.contenido.to_s +
														'","dia": "'+ 	mensaje.publicado.strftime('%h %d ').to_s +
														'","anno": "'+ 	mensaje.publicado.strftime('%Y').to_s +
														'","fecha": "'+ mensaje.publicado.strftime('%d/%_m/%Y').to_s +
														'","hora": "'+ 	mensaje.publicado.strftime('%H:%M').to_s +
														'","url": "'  "/mensajes/"   + mensaje.id.to_s +  '"}, '
				        else
							 $tirajson2 = $tirajson2 +   ' { "usuario": "' + mensaje.usuario.nombre.to_s + " "+ mensaje.usuario.apellido.to_s +
														'","nombre": "'+ mensaje.titulo.to_s +
														'","descripcion": "'+ mensaje.contenido.to_s +
														'","dia": "'+ 	mensaje.publicado.strftime('%h %d ').to_s +
														'","anno": "'+ 	mensaje.publicado.strftime('%Y').to_s +
														'","fecha": "'+ mensaje.publicado.strftime('%d/%_m/%Y').to_s +
														'","hora": "'+ 	mensaje.publicado.strftime('%H:%M').to_s +
														'","url": "'  "/mensaje/"   + mensaje.id.to_s +  '"} '
				      end
				    		@i2=@i2+1
				  end
				   	 $tirajson2 = $tirajson2 + ' ]'
			   else
			    $tirajson2 = '[ ]'; 
			   end
			   
			  		render :json => $tirajson2 
			
		end

		def generarClasesCalendarioEstudiante

			numero 	= params[:number]

			@evaluaciongrupos = EvaluacionGrupo.includes(:grupo).where("grupo_id = ?", numero)
			@evaluaciongrupos = EvaluacionGrupo.includes(:evaluacion).where("grupo_id = ?", numero).order('fecha_habilitacion ASC')

			@evaluaciongrupos.each do |eva|
				@eval = eva
			end
			
			facilitador_id =@eval.grupo.curso.facilitador_id

				@son2 = @evaluaciongrupos.count

				if @son2 > 0 
				    @i2=1
				    $tirajson2 = '['
				    $tirajson2 = $tirajson2 +   ' { "title": "'  + "inicio del curso: " +@eval.grupo.curso.nombre.to_s  + 
												   '","start": "'  +@eval.grupo.fecha_inicio.strftime('%Y/%m/%d').to_s + '"}, '

				 @evaluaciongrupos.each do |evaluaciongrupo|
				      	if @i2<@son2

							$tirajson2 = $tirajson2 +   ' { "title": "'  + evaluaciongrupo.evaluacion.titulo.to_s + 
														'","start": "'+ evaluaciongrupo.fecha_habilitacion.strftime('%Y/%m/%d').to_s +
														'","end": "'+ 	evaluaciongrupo.fecha_cierre.strftime('%Y/%m/%d').to_s +
														'","url": "'  "/clases/"+1.to_s+"/evaluacion/"+evaluaciongrupo.id.to_s+"/overview" +  '"}, '
				        else
							 $tirajson2 = $tirajson2 +    ' { "title": "'  + evaluaciongrupo.evaluacion.titulo.to_s + 
														'","start": "'+ evaluaciongrupo.fecha_habilitacion.strftime('%Y/%m/%d').to_s +
														'","end": "'+ 	evaluaciongrupo.fecha_cierre.strftime('%Y/%m/%d').to_s +
														'","url": "'  "/clases/"+1.to_s+"/evaluacion/"+evaluaciongrupo.id.to_s+"/overview" +  '"} '
				      end
				    		@i2=@i2+1
				  end
				    $tirajson2 = $tirajson2 +   ' { "title": "'  + "Fin del curso: " +@eval.grupo.curso.nombre.to_s  + 
												   '","start": "'  +@eval.grupo.fecha_fin.strftime('%Y/%m/%d').to_s + '"} '
				   	 $tirajson2 = $tirajson2 + ' ]'
			   else
			    $tirajson2 = '[ { "title": "'  + "Inicio del curso: " +@eval.grupo.curso.nombre.to_s  + 
												   '","start": "'  +@eval.grupo.fecha_inicio.strftime('%Y/%m/%d').to_s + '"}, { "title": "'  + "Fin del curso: " +@eval.grupo.curso.nombre.to_s  + 
												   '","start": "'  +@eval.grupo.fecha_fin.strftime('%Y/%m/%d').to_s + '"} ]'
			   end
			   
			  		render :json => $tirajson2 	
		end

		


		def generarClasesCalendarioFacilitador
			

					@grupos = Grupo.includes(:curso).where('fecha_inicio <= ? and ? <= fecha_fin ', Time.now.midnight,Time.now.midnight).where(cursos: { facilitador_id: current_usuario.id } )

				$tirajson2 = '['
					@grupos.each do |grupo|


					 	$tirajson2 = $tirajson2 +   ' { "title": "'  + "inicio del curso: " +grupo.curso.nombre.to_s  + 
														   '","start": "'  +grupo.fecha_inicio.strftime('%Y/%m/%d').to_s + '"}, '

						@evaluaciongrupos = EvaluacionGrupo.includes(:evaluacion).where("grupo_id = ?", grupo.id).order('fecha_habilitacion ASC')								   
						@evaluaciongrupos.each do |evaluaciongrupo|

							$tirajson2 = $tirajson2 +   ' { "title": "'  + grupo.curso.nombre + " " + evaluaciongrupo.evaluacion.titulo.to_s + 
																'","start": "'+ evaluaciongrupo.fecha_habilitacion.strftime('%Y/%m/%d').to_s +
																'","end": "'+ 	evaluaciongrupo.fecha_cierre.strftime('%Y/%m/%d').to_s +
																'","url": "'  "/clases/"+grupo.id.to_s+"/evaluacion/"+evaluaciongrupo.id.to_s+"/overview" +  '"}, '


						end

						 $tirajson2 = $tirajson2 +   ' { "title": "'  + "Fin del curso: " +grupo.curso.nombre.to_s  + 
															   '","start": "'  +grupo.fecha_fin.strftime('%Y/%m/%d').to_s + '"}, '
						
					end
					$contador = $tirajson2.length
					 $tirajson2 =  $tirajson2[0, $contador-2] + ']'
					   
					  		render :json => $tirajson2 	
				end

		



end