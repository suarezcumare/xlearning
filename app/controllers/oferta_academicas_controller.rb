class OfertaAcademicasController < ApplicationController
	def new
		# carrera = ItemEstructuraOfertaAcademica.create(nombre: "Ingenieria Informatica")
		# s1 = ItemEstructuraOfertaAcademica.create(nombre: "1")
		# s1.children.create(nombre: "Calculo I")
		# s1.children.create(nombre: "Estructuras Discretas")
		# s2 = ItemEstructuraOfertaAcademica.create(nombre: "2")
		# s2.children.create(nombre: "Algebra Linal")
		# s2.children.create(nombre: "Introduccion a la computacion")
		# s3 = ItemEstructuraOfertaAcademica.create(nombre: "3")
		# s3.children.create(nombre: "Programacion en C++")
		# s3.children.create(nombre: "Fundamentos de Desarrollo Web")
		# s4 = ItemEstructuraOfertaAcademica.create(nombre: "4")
		# s4.children.create(nombre: "Diseno UX")
		# s4.children.create(nombre: "API de Google Maps")
		# carrera.children << s1 
		# carrera.children << s2 
		# carrera.children << s3 
		# carrera.children << s4 
		render json: "ok"
	end
	def index
		render ok #.to_json
	end
	def show
		respond_to do |format|
		    format.html  # index.html.erb
		    format.json  { 
		    	result = jsonify(ItemEstructuraOfertaAcademica.find(params[:id]))
		    	render :json => result
		    }
		end
	end
	def destroy
		if ItemEstructuraOfertaAcademica.exists? params[:id]
			item = ItemEstructuraOfertaAcademica.find params[:id]
			#item.destroy
			render json: "ok"
		else
			render json: "no existe el elemento"
		end
	end
	def create
		if ItemEstructuraOfertaAcademica.exists? params[:nivel][:id]
			item = ItemEstructuraOfertaAcademica.find params[:nivel][:id]
			item.nombre = params[:nivel][:nombre]
			item.save
			render json: item
		else
			item = ItemEstructuraOfertaAcademica.create(nombre: params[:nivel][:nombre])
			item.update(parent_id: params[:nivel][:pid])
			item.update(est_oferta_acad_id: params[:nivel][:estructura_id])
			render json: item
		end
	end
	private
		def jsonify element
			hijos = Array.new
			element.children.each do |h|
				hijos << jsonify(h)
			end
			if element.leaf?
				subnivel = {"id"=>0, "nombre"=>"curso"}				
				return Hash["self"=>element,"estructura"=>element.estructura, "subnivel"=>subnivel, "cursos"=>element.cursos]
			else
				subnivel = element.estructura.children[0]
				return Hash["self"=>element,"estructura"=>element.estructura, "subnivel"=>subnivel, "hijos"=>hijos]
			end
		end
end