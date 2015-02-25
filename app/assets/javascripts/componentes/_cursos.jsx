//var Fluxxor = require("fluxxor");
var Utilidades = {
	acortarCadena: function(cadena, longitud){
		var tmp = cadena.substring(0, longitud) + " ...";
		return tmp;
	}
};

//Contantes que representan las posibles acciones
var constantes = {
	CARGAR_OFERTA: "CARGAR_OFERTA", 
	CARGAR_CURSO: "CARGAR_CURSO",
	GUARDAR_CURSO: "GUARDAR_CURSO",
	ELIMINAR_CURSO: "ELIMINAR_CURSO",
	GUARDAR_NIVEL: "AGREGAR_NIVEL",
	ELIMINAR_NIVEL: "ELIMINAR_NIVEL",
	ELIMINAR_MODULO: "ELIMINAR_MODULO",
	GUARDAR_MODULO: "GUARDAR_MODULO",
	GUARDAR_ASIGNACION: "GUARDAR_ASIGNACION"
};

//Store
var OfertaAcademicaStore = Fluxxor.createStore({
	initialize: function(){
		this.oferta= [];
		this.bindActions(
	      constantes.CARGAR_OFERTA, this.cargarOferta,
	      constantes.CARGAR_CURSO, this.cargarCurso,
	      constantes.GUARDAR_CURSO, this.guardarCurso,
	      constantes.ELIMINAR_CURSO, this.eliminarCurso,
	      constantes.GUARDAR_NIVEL, this.guardarNivel,
	      constantes.ELIMINAR_NIVEL, this.eliminarNivel,
	      constantes.ELIMINAR_MODULO, this.eliminarModulo,
	      constantes.GUARDAR_MODULO, this.guardarModulo,
	      constantes.GUARDAR_ASIGNACION, this.guardarAsignacion
	    );
	},
	getState: function(){
		return {data: this.oferta};
	},
	guardarAsignacion: function(payload){
		var nueva = payload.asignacion.id == "";
		var asignacion = payload.asignacion;
		$.ajax({
		    url: "/modulos/"+asignacion.modulo_id+"/asignacions/",
		    data: {asignacion: asignacion},
		    type:"POST",
		    dataType: 'json',
		    success: function(data){
		    	$.extend(true,asignacion, data);
		    	console.log(asignacion);
		    	swal("","Se ha guardado la asignación.","success");
		    }
		});
		var modulo = this._getModulo(asignacion.curso_id, asignacion.modulo_id);
		if(nueva){
			modulo.asignacions.push(asignacion);
		}else{
			for (var i = 0; i < modulo.asignacions.length; i++) {
				if(modulo.asignacions[i].id === asignacion.id){
					$.extend(true, modulo.asignacions[i], asignacion);	
					break;
				}
			}
		}
		this.emit("change");
	},
	eliminarModulo: function(payload){
		var curso = this._getCurso(payload.pid, this.oferta);
		if(curso){
			var len = curso.modulos.length;
			for (var i = 0; i < len; i++) {
				if(curso.modulos[i].id === payload.id){
					curso.modulos.splice(i, 1);
					break;
				}
			}
		}
		$.ajax({
	      url: "/cursos/"+payload.pid+"/modulos/"+payload.id,
	      dataType: 'json',
	      type:"DELETE"});
		this.emit("change");
	},
	guardarModulo: function(payload){
		var nueva = payload.modulo.id == "";
		var modulo = payload.modulo;
		$.ajax({
		    url: "/cursos/"+modulo.curso_id+"/modulos/",
		    data: {modulo: modulo},
		    type:"POST",
		    dataType: 'json',
		    success: function(data){
		    	$.extend(true,modulo, data);
		    	console.log(modulo);
		    	swal("","Se ha guardado el módulo.","success");
		    }
		});
		var curso = this._getCurso(modulo.curso_id, this.oferta);
		if(nueva){
			curso.modulos.push(modulo);
		}else{
			for (var i = 0; i < curso.modulos.length; i++) {
				if(curso.modulos[i].id === modulo.id){
					$.extend(true, curso.modulos[i], modulo);	
					break;
				}
			}
		}
		this.emit("change");
	},
	cargarCurso: function(payload){
		var curso = this._getCurso(payload.curso_id, this.oferta);
		if(curso.modulos != undefined) return;
		if(curso != null){
			$.ajax({
		      url: "/cursos/"+payload.curso_id+".json",
		      dataType: 'json',
		      type:"get",
		      success: function(data) {
		        // curso.modulos = data.modulos;
		        // curso.categoria = data.categoria;
		        $.extend(curso, data);
		        this.emit("change");
		        
		      }.bind(this),
		      error: function(xhr, status, err) {
		        console.error(status, err.toString());
		      }.bind(this)
		    });		
		}
	},
	guardarCurso: function(payload){
		if(payload.curso.id!="") {
			var curso = this._getCurso(payload.curso.id, this.oferta)
			console.log("esta es la version vieja");
		}else{var curso = payload.curso;}
		var contexto = this;
		$.ajax({
		    url: "/cursos",
		    data: {curso: payload.curso},
		    type:"POST",
		    dataType: 'json',
		    success: function(data){
		    	$.extend(curso, data);
		    	console.log(contexto._getCurso(data.id, contexto.oferta));
		    	swal("","Se ha guardado el curso.","success");
		    }
		});
		if(payload.curso.id == ""){
			var nivel = this._getNivel(curso.item_estructura_id, this.oferta);
			nivel.cursos.push(curso);
		}
		this.emit("change");
	},
	guardarNivel: function(payload){
		var nueva = payload.nivel.id == "";
		var nivel = payload.nivel;
		$.ajax({
		    url: "/oferta_academica/",
		    data: {nivel: nivel},
		    type:"POST",
		    dataType: 'json',
		    success: function(data){
		    	nivel.nombre = data.nombre;
		    	nivel.id = data.id;
		    	swal("","Se ha guardado el nivel.","success");
		    }
		});
		
		if(nueva){
			var nivel_padre = this._getNivel(nivel.pid, this.oferta);
			nivel_padre.hijos.push(nivel);
		}else{
			var nuevo_nivel = this._getNivel(nivel.id, this.oferta);
			$.extend(true, nuevo_nivel.self, nivel);	
		}
		this.emit("change");
	},
	eliminarNivel: function(payload){
		var id = payload.id, 
			cola = [this.oferta], encontrado = false;
		if(this.oferta.self.id === id)
			this.oferta = []
		else{
			while(cola.length > 0 && !encontrado){
				var c = cola.pop();
				if(c.hijos != undefined)
					for (var i = 0;i < c.hijos.length; i++) {
						if(c.hijos[i].self.id === id){
							c.hijos.splice(i,1);
							encontrado = true;
							break;
						}else
							cola.push(c.hijos[i]);
					}
			}
		}
		$.ajax({
	      url: "/oferta_academica/"+payload.id,
	      dataType: 'json',
	      type:"DELETE"});
		this.emit("change");
	},
	eliminarCurso: function(payload){
		var id = payload.id, 
			cola = [this.oferta], encontrado = false;
		while(cola.length > 0 && !encontrado){
			var c = cola.pop();
			if(c.hijos != undefined)
				for (var i = 0;i < c.hijos.length; i++)
					cola.push(c.hijos[i]);
			else
				for (var i = 0;i < c.cursos.length; i++) {
					if(c.cursos[i].id === id){
						c.cursos.splice(i,1);
						encontrado = true;
						break;
					}
				}
		}
		$.ajax({
	      url: "/cursos/"+id,
	      dataType: 'json',
	      type:"DELETE"});
		this.emit("change");
	},
	cargarOferta: function(payload){
		$.ajax({
	      url: "/oferta_academica/"+payload.id+".json",
	      dataType: 'json',
	      type:"get",
	      success: function(data) {
	        this.oferta = data;
	        this.emit("change");
	        //console.log(this.state.data);
	      }.bind(this),
	      error: function(xhr, status, err) {
	        console.error(status, err.toString());
	      }.bind(this)
	    });
	},
	_getNivel: function(id, nodo){
		if(nodo.self.id === id)
			return nodo;
		if(nodo.hijos === undefined)
			return null;
		for (i = 0; i < nodo.hijos.length; i++) {
			var hijo = this._getNivel(id,nodo.hijos[i]);
			if(hijo != null)
			return hijo;	
		}
		return null;
	},
	_getCurso: function(id, nodo){
		if(nodo.self === undefined)
			return (nodo.id === id)?nodo:null;
		if(nodo.cursos === undefined){
			for (var i = 0; i < nodo.hijos.length; i++) {
				var curso = this._getCurso(id, nodo.hijos[i]);
				if(curso != null)
					return curso;	
			}
		}else{
			for (var i = 0; i < nodo.cursos.length; i++) {
				var curso = this._getCurso(id,nodo.cursos[i]);
				if(curso != null)
					return curso;	
			}
		}
		return null;	
	},
	_getModulo: function(pid, id){
		var curso = this._getCurso(pid, this.oferta);
		for(var i = 0; i < curso.modulos.length; i++)
			if(curso.modulos[i].id === id)
				return curso.modulos[i];
		return null;
	}
});

//Acciones que usara el despachador
var acciones = {
	cargarCurso: function(curso_id){
		this.dispatch(constantes.CARGAR_CURSO, {curso_id: curso_id})
	},
	cargarOferta: function(id){
		this.dispatch(constantes.CARGAR_OFERTA, {id: id})	
	},
	eliminarNivel: function(id){
		this.dispatch(constantes.ELIMINAR_NIVEL, {id: id})
	},
	eliminarCurso: function(id){
		this.dispatch(constantes.ELIMINAR_CURSO, {id: id})
	},
	eliminarLeccion: function(id, pid){
		this.dispatch(constantes.ELIMINAR_MODULO, {id: id, pid: pid})	
	},
	guardarCurso: function(curso){
		this.dispatch(constantes.GUARDAR_CURSO, {curso:curso})
	},
	guardarLeccion: function(leccion){
		this.dispatch(constantes.GUARDAR_MODULO, {modulo:leccion})
	},
	guardarAsignacion: function(asignacion){
		this.dispatch(constantes.GUARDAR_ASIGNACION, {asignacion: asignacion});
	},
	guardarNivel: function(nivel){
		this.dispatch(constantes.GUARDAR_NIVEL, {nivel: nivel});
	}
};

//Variables que mantienen los almacenamientos
var stores = {
	OfertaAcademicaStore: new OfertaAcademicaStore()
};

var flux = new Fluxxor.Flux(stores, acciones);

flux.on("dispatch", function(type, payload) {
  if (console && console.log) {
    console.log("[Dispatch]", type, payload);
  }
});


var FluxMixin = Fluxxor.FluxMixin(React)//,
	//StoreWatchMixin = Fluxxor.StoreWatchMixin;
var ItemEvaluacion = React.createClass({
	mixins: [FluxMixin],
	render: function(){
		return (
			<tr>
              	<td></td>
              	<td colSpan="2">
                <a href="javascript:void(0)">
                </a>
                <a href="javascript:void(0)"><i className="fa fa-download"></i></a>
              </td>
            </tr>
		);
	}
});
var ItemMaterial = React.createClass({
	mixins: [FluxMixin],
	render:function(){
		return (
			<tr>
              <td></td>
              <td colSpan="2">
                <a href="javascript:void(0)" className="visualizador-contenido" 
                	data-contenido={this.props.material.tipo_archivo.nombre}>
                  <i className={this.props.material.tipo_archivo.icono}></i>
                  {this.props.material.nombre}</a>
                <a href="javascript:void(0)"><i className="fa fa-download"></i></a>
              </td>
            </tr>
		);
	}
});
var ItemLeccion = React.createClass({
	mixins: [FluxMixin],
	eliminar: function(){
		var acciones = this.getFlux().actions,
			id = this.props.leccion.id, pid = this.props.padre;
		swal({
		   	title: "¿Eliminar esta lección?",
		    text: "No podrás deshacer esta acción una vez eliminado.",
		    type: "warning",
		    showCancelButton: true,
		    confirmButtonText: "Si",
		    cancelButtonText: "Cancelar",
		    closeOnConfirm: false}, 
			function(){   
				acciones.eliminarLeccion(id, pid);
				swal("Eliminado", "Se ha eliminado la lección.", "success"); 
		});
	},
	editar:function(){
		React.render(
		  <FormularioLeccion leccion={this.props.leccion} flux={flux}/>,
		  document.getElementById('modal-principal')
		);
		$('#modal-principal').openModal();
	},
	agregar: function(opcion){
		switch(opcion){
			case 1: React.render(
					  <FormularioObjetoAprendizaje asignacion={{modulo_id: this.props.leccion.id,
					  		curso_id: this.props.leccion.curso_id}} flux={flux}/>,
					  document.getElementById('modal-principal')
					);
					break;
			case 2: React.render(
					  <FormularioEvaluacion asignacion={{modulo_id: this.props.leccion.id,
					  		curso_id: this.props.leccion.curso_id}} flux={flux}/>,
					  document.getElementById('modal-principal')
					);
					break;
			case 3: React.render(
					  <FormularioAsignacion asignacion={{modulo_id: this.props.leccion.id,
					  		curso_id: this.props.leccion.curso_id}} flux={flux}/>,
					  document.getElementById('modal-principal')
					);
		}
		$('#modal-principal').openModal();
	},
	componentDidMount: function() {
		var id = "dd-leccion"+this.props.leccion.id;
		var ulMarkup = "<ul id='"+id+"' class='dropdown-content'>"+
			"<li><a class='objeto-estudio'>Objecto de aprendizaje</a></li>"+
			"<li><a class='evaluacion'>Evaluación</a></li>"+
			"<li><a class='asignacion'>Asignación</a></li></ul>";
		var ulElement = $(ulMarkup).appendTo("body");
		$(ulElement).find("a").click(function() { return false; });
    	$(ulElement).find("a.objeto-estudio").click(this.agregar.bind(this,1));
    	$(ulElement).find("a.evaluacion").click(this.agregar.bind(this,2));
    	$(ulElement).find("a.asignacion").click(this.agregar.bind(this,3));
	},
	componentWillUnmount: function(){
		var id = "#dd-leccion"+this.props.item.id;
		$(id).remove();
	},
	render: function(){
		var objeto_aprendizajes = this.props.leccion.objeto_aprendizajes,
			asignacions = null,
			evaluaciones = null;
		if(this.props.leccion.asignacions != undefined)
			asignacions = this.props.leccion.asignacions.map(function(o){
								return <ItemAsignacion key={"E-"+o.id} asignacion={o}/>
							});
		if(this.props.leccion.evaluacions != undefined)
			evaluaciones = this.props.leccion.evaluacions.map(function(o){
						return <ItemEvaluacion key={"E-"+o.id} evaluacion={o}/>
					});

		return (
			<div className="panel panel-primary leccion">
	    		<div className="panel-heading">
	    			<a data-toggle="collapse" href={"#leccion"+this.props.leccion.id} 
		        	className="panel-title">
				        <h4>
				           Lección {this.props.leccion.orden}: {this.props.leccion.nombre} 
				        </h4>
				    </a>
			        <div className="acciones">
			        	<ul className="list-inline">
				  			<li>
				  				<a href="javascript:void(0)" onClick={this.eliminar}>
								<i className="white-text mdi-content-clear"></i>
								</a>
							</li>
							<li>
								<a href="javascript:void(0)" onClick={this.editar}>
								<i className="white-text mdi-content-create"></i>
								</a>
							</li>
							<li>
								<a href="javascript:void(0)" onClick={this.agregar}
									className="dropdown-button" 
									data-activates={"dd-leccion"+this.props.leccion.id}>
									<i className="white-text mdi-content-add"></i>
								</a>
							</li>
						</ul>
					</div>
	    		</div>
			    
				<div id={"leccion"+this.props.leccion.id} className="panel-body collapse">
			      <div className="panel-body">
			        <div className="descripcion-leccion pad15 pad30-h">{this.props.leccion.descripcion}</div>
			        <div>
			        	<table className="bordered contenido material">
		            		<tr className="header">
				              <th style={{width: "25px"}}></th>
				              <th><i className="fa fa-graduation-cap"></i> Material </th>
				              <th>
				                <a href="javascript:void(0)"><i className="fa fa-download"></i></a>  
				              </th>
				            </tr>
						{(objeto_aprendizajes != undefined && objeto_aprendizajes.length > 0)?
    						this.props.leccion.objeto_aprendizajes.map(function(o){
								return <ItemMaterial key={"M-"+o.id} material={o}/>
							})
						:<tr><td colSpan="3">No hay material en esta sección.</td></tr>}
						</table>
	        		</div>
			        <div>
			        	<table className="bordered contenido evaluaciones">
				            <tr  className="header">
				              <th style={{width: "25px"}}></th>
				              <th><i className="fa fa-graduation-cap"></i> Evaluaciones </th>
				              <th>
				                <a href="javascript:void(0)"><i className="fa fa-download"></i></a>  
				              </th>
				            </tr>
			        	{(evaluaciones != null || asignacions != null)?
	        				<tbody>{evaluaciones}
	        				{asignacions}</tbody>
							:<tr><td colSpan="3">No hay actividades en esta sección.</td></tr>}
						</table>
			        </div>              
			      </div>
			    </div>
			  </div>
		);
	}
});
var ItemCurso = React.createClass({
	mixins: [FluxMixin, Utilidades],
	cargarCurso:function(){
		if(this.props.item.modulos === undefined)
			this.getFlux().actions.cargarCurso(this.props.item.id);
		// React.render(
		//   <ItemDetalleCurso curso={this.props.item}/>,
		//   document.getElementById('detalles')
		// );
	},
	eliminar: function(){
		var acciones = this.getFlux().actions,
			id = this.props.item.id;
		swal({
		   	title: "¿Eliminar este curso?",
		    text: "No podrás deshacer esta acción una vez eliminado.",
		    type: "warning",
		    showCancelButton: true,
		    confirmButtonText: "Si",
		    cancelButtonText: "Cancelar",
		    closeOnConfirm: false}, 
			function(){   
				acciones.eliminarCurso(id);
				swal("Eliminado", "Se ha eliminado el curso.", "success"); 
		});
	},
	agregar: function(){
		React.render(
		  <FormularioLeccion leccion={{curso_id: this.props.item.id}} flux={flux}/>,
		  document.getElementById('modal-principal')
		);
		$('#modal-principal').openModal();
	},
	editar: function(){
		React.render(
		  <AgregarCursoFormulario curso={this.props.item} flux={flux}/>,
		  document.getElementById('modal-principal')
		);
		$('#modal-principal').openModal();
	},
	componentDidMount: function() {
		var id = "dd"+this.props.item.id;
		var ulMarkup = "<ul id='"+id+"' class='dropdown-content'>"+
			"<li><a class='accion-agregar'>Agregar lección</a></li>"+
			"<li><a class='accion-editar'>Editar curso</a></li>"+
			"<li><a class='accion-eliminar'>Eliminar curso</a></li></ul>";
		var ulElement = $(ulMarkup).appendTo("body");
		$(ulElement).find("a").click(function() { return false; });
    	$(ulElement).find("a.accion-eliminar").click(this.eliminar);
    	$(ulElement).find("a.accion-agregar").click(this.agregar);
    	$(ulElement).find("a.accion-editar").click(this.editar);
	},
	componentWillUnmount: function(){
		var id = "#dd"+this.props.item.id;
		$(id).remove();
	},
	render: function(){
		var pid=this.props.item.id;
		if(this.props.item.modulos !== undefined && this.props.item.modulos.length > 0){
			var modulos = this.props.item.modulos.map(function(m){
				return (<ItemLeccion key={m.id} leccion={m} padre={pid}/>);
			});
		}else{
			var modulos=<div className="text-center">No hay módulos para este curso.</div>;
			
		}
		var divStyle={backgroundImage: "url("+this.props.item.imagen_url+")"};
		return (
			<div className="panel panel-curso">
				<div className="panel-heading">
					<div className="acciones">
				  		<a href="javascript:void(0)" className="accion dropdown-button" 
							data-activates={"dd"+this.props.item.id}>
							<i className="mdi-navigation-more-vert grey-text darken-2"></i>
						</a>
					</div>
					<div className="media">
					  	<div className="media-left" style={divStyle}>
					  	</div>
					  	<div className="media-body">
					  		<a href={"#item-"+this.props.item.id} data-toggle="collapse" onClick={this.cargarCurso}>
					    	<h4 className="media-heading">{this.props.item.nombre}</h4>
					   		<p className="descripcion">
					   			{this.acortarCadena(this.props.item.descripcion,100)}</p> 
					   		</a>
					  	</div>
					</div>
					
				</div>
				<div id={"item-"+this.props.item.id} className="panel-body collapse">
					{modulos}
				</div>
			</div>
		);
	}
});
var ItemOferta = React.createClass({
	mixins: [FluxMixin],
	// propTypes: {
	// 	item: React.PropTypes.object.isRequired
	// },
	agregar: function(){
		if(this.props.item.hijos === undefined){
			React.render(
			  <AgregarCursoFormulario curso={{item_estructura_id: this.props.item.self.id}} 
			  		flux={flux}/>,
			  document.getElementById('modal-principal')
			);
		}else{
			var item = {estructura_id: this.props.item.subnivel.id,
					pid: this.props.item.self.id};
			React.render(
			  <AgregarNivelFormulario item={item.self} flux={flux}/>,
			  document.getElementById('modal-principal')
			);	
		}
		
		$('#modal-principal').openModal();
	},
	componentDidMount: function() {
		var id = "dd"+this.props.item.self.id,
			nombre = this.props.item.estructura.nombre,
			subnivel = this.props.item.subnivel.nombre;
		var ulMarkup = "<ul id='"+id+"' class='dropdown-content'>"+
			"<li><a class='accion-agregar'>Agregar "+subnivel+"</a></li>"+
			"<li><a>Editar "+nombre+"</a></li>"+
			"<li><a class='accion-eliminar'>Eliminar "+nombre+"</a></li></ul>";
		var ulElement = $(ulMarkup).appendTo("body");
		$(ulElement).find("a").click(function() { return false; });
    	$(ulElement).find("a.accion-eliminar").click(this.eliminar);
		$(ulElement).find("a.accion-agregar").click(this.agregar);
	},
	componentWillUnmount: function(){
		var id = "#dd"+this.props.item.self.id;
		$(id).remove();
	},
	eliminar: function(e){
		var acciones = this.getFlux().actions,
			id = this.props.item.self.id;
		swal({
		   	title: "¿Estás seguro que deseas eliminar este elemento?",
		    text: "No podrás deshacer esta acción.",
		    type: "warning",
		    showCancelButton: true,
		    confirmButtonText: "Si",
		    closeOnConfirm: false}, 
			function(){   
				acciones.eliminarNivel(id);
				swal("Eliminado", "Se ha eliminado el elemento.", "success"); 
		});
		
	},
	render: function(){
		//console.log("Renderizando el elemento con id "+this.props.item.self.id);
		var subitems = []
		if (this.props.item.hijos === undefined) {
			subitems = this.props.item.cursos.map(function(curso, i){
				return (
					<ItemCurso item={curso} key={curso.id}/>
				);
			});
		} else{
			subitems = this.props.item.hijos.map(function(nivel, i){
				return (
					<ItemOferta item={nivel} key={nivel.self.id}/>
				);
			});
		};
		return (
			<div className="panel item-arbol">
				<div className="panel-heading">
					<div className="indicador">
						<i className="fa fa-angle-right"></i>
					</div>
					<a href={"#item-"+this.props.item.self.id} data-toggle="collapse">
						<h5>{this.props.item.estructura.nombre} {this.props.item.self.nombre}</h5>
					</a>
					<div className="acciones">
						<a href="#" className="accion dropdown-button" 
							data-activates={"dd"+this.props.item.self.id}>
							<i className="mdi-navigation-more-vert"></i>
						</a>
					</div>
				</div>
				<div id={"item-"+this.props.item.self.id} className="panel-body collapse in">
					{subitems}
				</div>
			</div>
		);
	}
});
var OfertaAcademica = React.createClass({
	mixins: [FluxMixin, Fluxxor.StoreWatchMixin("OfertaAcademicaStore")],
	getInitialState: function(){
		return {};
	},
	getStateFromFlux: function() {
	    var flux = this.getFlux();
	    return flux.store("OfertaAcademicaStore").getState();
	},
	componentDidMount: function() {
		this.getFlux().actions.cargarOferta(this.props.id);
		//$('.tooltipped').tooltip();
	},
	componentDidUpdate: function(prevProps, prevState){
		//$('.tooltipped').tooltip();
		$('.dropdown-button').dropdown({
			constrain_width: false, // Does not change width of dropdown to that of the activator
			hover: false, // Activate on click
			alignment: 'left', // Aligns dropdown to left or right edge (works with constrain_width)
			gutter: 0, // Spacing from edge
			belowOrigin: true // Displays dropdown below the button
		});
	},
	render: function(){
		return (
			<div>
				{ (this.state.data.length == 0) ? "":
					<ItemOferta item={this.state.data} key={this.state.data.self.id} />}
			</div>
		);
	}
});

var ItemDetalleCurso = React.createClass({
	render: function(){
		return (
			<div className="panel">
				<div className="panel-body">
					<h4>{this.props.curso.nombre}</h4>
					<div>{this.props.curso.categoria.map(function(c){
						return <span className="badge white-text red darken-1">{c.nombre}</span> ;
					})}</div>
					<p>{this.props.curso.descripcion}</p>
					<h6>Objetivos</h6>
					<p>{this.props.curso.objetivos}</p>
					<h6>Prerequisitos</h6>
					<p>{this.props.curso.prerequisitos}</p>
					<h6>Perfil del estudiante</h6>
					<p>{this.props.curso.perfil_estudiante}</p>
				</div>
			</div>
		);
	}
});

var AgregarCursoFormulario = React.createClass({
	mixins: [FluxMixin, React.addons.LinkedStateMixin],
	getInitialState: function(){
		return ({
			id:"",
			nombre:"",
			descripcion:"",
			objetivos:"",
			prerequisitos:"",
			perfil_estudiante:"",
			pago:false,
			costo:0,
			matricula_maxima:-1,
			puntaje_aprobacion:10,
			horas_semanales:0,
			imagen_url:""
		});
	},
	guardarCurso: function(){
		this.getFlux().actions.guardarCurso(this.state);
	},
	componentDidMount: function(){
		var nuevoCurso = $.extend({},this.state, this.props.curso);
		this.setState(nuevoCurso);
	},
	componentWillReceiveProps: function(nextProps){
		var nuevoCurso = $.extend({},this.getInitialState(), nextProps.curso);
		this.setState(nuevoCurso);
	},
	handleChange: function(evt){
		var target = evt.target;
		var propiedad = target.getAttribute("name"),
		nuevoEstado = this.state;
		if(target.type === "checkbox"){
			nuevoEstado[propiedad] = $(target).prop("checked");
			nuevoEstado["costo"] = 0;
		}else
			nuevoEstado[propiedad] = target.value;
		this.setState(nuevoEstado);
	},
	render: function(){
		return (
			<div>
				<div className="modal-content">
			      	<h4>{(this.state.id=="")?"Crear un nuevo curso":"Editar curso"}</h4>
			      	<a href="#informacion-basica" data-toggle="collapse">
			      		<h5>Información básica</h5></a>
			      	<div id="informacion-basica" className="collapse in">
			      		<div className="row">
					      	<div className="input-field col s6">
					        	<label>Nombre*</label>
					        	<input type="text" id="nombre" value={this.state.nombre} name="nombre"
					        		onChange={this.handleChange}/>
					      	</div>
					    </div>
				      	<div className="row">
				      		<div className="input-field col s6">
					        	<label>Descripción*</label>
					        	<textarea value={this.state.descripcion}
					        		className="materialize-textarea" name="descripcion"
				        			onChange={this.handleChange}/>
					      	</div>
					      	<div className="input-field col s6">
					        	<label>Objetivos*</label>
					        	<textarea value={this.state.objetivos}
					        		className="materialize-textarea" name="objetivos"
				        		onChange={this.handleChange}/>
					      	</div>
					    </div>
					    <div className="row">
					      	<div className="input-field col s6">
					        	<label>Prerequisitos*</label>
					        	<textarea value={this.state.prerequisitos}
					        	className="materialize-textarea"  name="prerequisitos"
				        			onChange={this.handleChange}/>
					      	</div>
					      	<div className="input-field col s6">
					        	<label>Perfil del estudiante</label>
					        	<textarea value={this.state.perfil_estudiante}
					        		className="materialize-textarea"  name="perfil_estudiante"
				        			onChange={this.handleChange}/>
					      	</div>
					    </div>
					</div>
					<hr/>
					<a href="#configuracion" data-toggle="collapse"><h5>Configuración</h5></a>
					<div id="configuracion" className="collapse in">
						<div className="row">
							<div className="col s4">
								<label> El curso es </label>
								<div className="switch">
								    <label>
								      Pago
								      <input type="checkbox" checked={this.state.pago} 
								  	onChange={this.handleChange} name="pago"/>
								      <span className="lever"></span>
								      Gratuito
								    </label>
								</div>
							</div>
							{(this.state.pago)?
								<div className="col s3 input-field">
									<label>Costo Bs. </label> <input type="text" name="costo"
									value={this.state.costo} onChange={this.handleChange}/></div>
									:<div></div>}
						</div>
					</div>
			    </div>
			    <div className="modal-footer">
			        <a href="javascript:void(0)" className="waves-effect waves-default 
			      		btn-flat modal-action modal-close">Cancelar</a>
			        <a href="javascript:void(0)" className="waves-effect waves-default 
			      		btn-flat modal-action modal-close" onClick={this.guardarCurso}>Guardar</a>
			    </div>
			</div>
		);
	}
});
var FormularioAsignacion = React.createClass({
	mixins: [FluxMixin],
	getInitialState: function(){
		return ({
			id:"",
			titulo:"",
			descripcion:"",
			instrucciones:"",
			puntuacion:"",
			modulo_id:"",
			tipo_archivo_id:"",
			curso_id:""
		});
	},
	guardarAsignacion: function(){
		//this.getFlux().actions.cargarCurso(this.state.curso_id);
		this.getFlux().actions.guardarAsignacion(this.state);
	},
	componentDidMount: function(){
		var nuevaAsignacion = $.extend(true,{},this.state, this.props.asignacion);
		this.setState(nuevaAsignacion);
	},
	componentWillReceiveProps: function(nextProps){
		var nuevaAsignacion = $.extend(true, {},this.getInitialState(), nextProps.asignacion);
		this.setState(nuevaAsignacion);
	},
	handleChange: function(evt){
		var target = evt.target;
		var propiedad = target.getAttribute("name"),
		nuevoEstado = this.state;
		nuevoEstado[propiedad] = target.value;
		this.setState(nuevoEstado);
	},
	guardarAsignacion: function(){
		this.getFlux().actions.guardarAsignacion(this.state);
	},
	render: function(){
		return (
			<div>
				<div className="modal-content">
			      	<h4>{(this.state.id=="")?"Crear una nueva asignación":"Editar asignación"}</h4>
			      	<a href="#informacion-basica" data-toggle="collapse">
			      		<h5>Información básica</h5></a>
			      	<div id="informacion-basica" className="collapse in">
			      		<div className="row">
					      	<div className="input-field col s6">
					        	<label>Titulo*</label>
					        	<input type="text" id="nombre" value={this.state.nombre} name="nombre"
					        		onChange={this.handleChange}/>
					      	</div>
					      	<div className="input-field col s6">
					        	<label>Puntuación*</label>
					        	<input type="text" id="puntuacion" value={this.state.puntuacion} 
					        		name="puntuacion" onChange={this.handleChange}/>
					      	</div>
					    </div>
					    <div className="row">
					      	<div className="input-field col s6">
					        	<label>Descripción*</label>
					        	<textarea value={this.state.descripcion}
					        	className="materialize-textarea"  name="descripcion"
				        			onChange={this.handleChange}/>
					      	</div>
					      	<div className="input-field col s6">
					        	<label>Instrucciones</label>
					        	<textarea value={this.state.instrucciones}
					        		className="materialize-textarea"  name="instrucciones"
				        			onChange={this.handleChange}/>
					      	</div>
					    </div>
				      	<div className="row">
				      		<div className="col s6">
				      		<label>Tipo de archivo</label>
							  	<select className="browser-default"  onChange={this.handleChange}
							  		value={this.state.tipo_archivo_id} name="tipo_archivo_id">
							    	<option value="" disabled selected>
							    		Escoge un tipo de archivo</option>
							    	<option value="2">Imagen</option>
							    	<option value="1">Documento de texto</option>
							    	<option value="3">Video</option>
							    	<option value="4">Archivo comprimido</option>
							  	</select>
					      	</div>
					    </div>
					</div>
				</div>
			    <div className="modal-footer">
			        <a href="javascript:void(0)" className="waves-effect waves-default 
			      		btn-flat modal-action modal-close">Cancelar</a>
			        <a href="javascript:void(0)" className="waves-effect waves-default 
			      		btn-flat modal-action modal-close" onClick={this.guardarAsignacion}>Guardar</a>
			    </div>
			</div>
		);
	}
});
var FormularioLeccion = React.createClass({
	mixins: [FluxMixin, React.addons.LinkedStateMixin],
	getInitialState: function(){
		return ({
			id:"",
			nombre:"",
			descripcion:"",
			curso_id:""
		});
	},
	guardarLeccion: function(){
		this.getFlux().actions.cargarCurso(this.state.curso_id);
		this.getFlux().actions.guardarLeccion(this.state);
	},
	componentDidMount: function(){
		var nuevaLeccion = $.extend({},this.state, this.props.leccion);
		this.setState(nuevaLeccion);
	},
	componentWillReceiveProps: function(nextProps){
		var nuevomodulo = $.extend({},this.getInitialState(), nextProps.leccion);
		this.setState(nuevomodulo);
	},
	handleChange: function(evt){
		var target = evt.target;
		var propiedad = target.getAttribute("name"),
		nuevoEstado = this.state;
		nuevoEstado[propiedad] = target.value;
		this.setState(nuevoEstado);
	},
	render: function(){
		return (
			<div>
				<div className="modal-content">
			      	<h4>{(this.state.id=="")?"Crear un nuevo módulo":"Editar módulo"}</h4>
			      	<a href="#informacion-basica" data-toggle="collapse">
			      		<h5>Información básica</h5></a>
			      	<div id="informacion-basica" className="collapse in">
			      		<div className="row">
					      	<div className="input-field col s6">
					        	<label>Nombre*</label>
					        	<input type="text" id="nombre" value={this.state.nombre} name="nombre"
					        		onChange={this.handleChange}/>
					      	</div>
					    </div>
				      	<div className="row">
				      		<div className="input-field col s10">
					        	<label>Descripción*</label>
					        	<textarea value={this.state.descripcion}
					        		className="materialize-textarea" name="descripcion"
				        			onChange={this.handleChange}/>
					      	</div>
					    </div>
					</div>
				</div>
			    <div className="modal-footer">
			        <a href="javascript:void(0)" className="waves-effect waves-default 
			      		btn-flat modal-action modal-close">Cancelar</a>
			        <a href="javascript:void(0)" className="waves-effect waves-default 
			      		btn-flat modal-action modal-close" onClick={this.guardarLeccion}>Guardar</a>
			    </div>
			</div>
		);
	}
});
var AgregarNivelFormulario = React.createClass({
	mixins: [FluxMixin],
	getInitialState: function(){
		return ({
			id: "",
			nombre:"",
			estructura_id:"",
			pid: ""
		});
	},
	componentDidMount: function(){
		var nuevoItem = $.extend({},this.state, this.props.item);
		this.setState(nuevoItem);
	},
	componentWillReceiveProps: function(nextProps){
		var nuevoItem = $.extend({},this.getInitialState(), nextProps.item);
		this.setState(nuevoItem);
	},
	handleChange: function(evt){
		var target = evt.target;
		var propiedad = target.getAttribute("name"),
		nuevoEstado = this.state;
		nuevoEstado[propiedad] = target.value;
		this.setState(nuevoEstado);
	},
	guardarNivel: function(){
		this.getFlux().actions.guardarNivel(this.state);
	},
	render: function(){
		return (
			<div>
				<div className="modal-content">
					<br/>
			      	<h4>Crear un nuevo nivel</h4>
			      	<br/>
			      	<div className="input-field col s10">
			        	<label>Nombre*</label>
			        	<input type="text" name="nombre" 
			        	value={this.state.nombre} onChange={this.handleChange}/>
			      	</div>
			    </div>
			    <div className="modal-footer">
			        <a href="javascript:void(0)" className="waves-effect waves-default 
			      		btn-flat modal-action modal-close">Cancelar</a>
			        <a href="javascript:void(0)" className="waves-effect waves-default 
			      		btn-flat modal-action modal-close" onClick={this.guardarNivel}>
			      		Guardar</a>
			    </div>
			</div>
		);
	}
});