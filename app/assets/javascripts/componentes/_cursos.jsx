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
	AGREGAR_CURSO: "AGREGAR_CURSO",
	ELIMINAR_CURSO: "ELIMINAR_CURSO",
	EDITAR_CURSO: "EDITAR_CURSO",
	AGREGAR_NIVEL: "AGREGAR_NIVEL",
	ELIMINAR_NIVEL: "ELIMINAR_NIVEL",
	EDITAR_NIVEL: "EDITAR_NIVEL"
};

//Store
var OfertaAcademicaStore = Fluxxor.createStore({
	initialize: function(){
		this.oferta= [];
		this.bindActions(
	      constantes.CARGAR_OFERTA, this.cargarOferta,
	      constantes.CARGAR_CURSO, this.cargarCurso,
	      constantes.AGREGAR_CURSO, this.agregarCurso,
	      constantes.ELIMINAR_CURSO, this.eliminarCurso,
	      constantes.EDITAR_CURSO, this.editarCurso,
	      constantes.AGREGAR_NIVEL, this.agregarNivel,
	      constantes.ELIMINAR_NIVEL, this.eliminarNivel,
	      constantes.EDITAR_NIVEL, this.editarNivel
	    );
	},
	getState: function(){
		return {data: this.oferta};
	},
	cargarCurso: function(payload){
		var curso = this._getCurso(payload.curso_id, this.oferta);
		if(curso != null){
			$.ajax({
		      url: "/cursos/"+payload.curso_id+".json",
		      dataType: 'json',
		      type:"get",
		      success: function(data) {
		        curso.modulos = data.modulos;
		        curso.categoria = data.categoria;
		        this.emit("change");
		        
		      }.bind(this),
		      error: function(xhr, status, err) {
		        console.error(status, err.toString());
		      }.bind(this)
		    });		
		}
	},
	agregarCurso: function(payload){
		this.emit("change");
	},
	eliminarCurso: function(payload){
		this.emit("change");
	},
	editarCurso: function(payload){
		this.emit("change");
	},
	agregarNivel: function(payload){
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
							console.log(c.hijos[i]);
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
	editarNivel: function(payload){
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
	// propTypes: {
	//     leccion: React.PropTypes.object.isRequired
	// },
	render: function(){
		return (
			<div className="panel panel-primary leccion">
				<a data-toggle="collapse" href={"#leccion"+this.props.leccion.id} 
			        className="titulo-leccion panel-title">
		    		<div className="panel-heading">
				        <h4>
				           Lección {this.props.leccion.orden}: {this.props.leccion.nombre} 
				        </h4>
		    		</div>
			    </a>
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
						{(this.props.leccion.objeto_aprendizajes.length > 0)?
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
			        	{(this.props.leccion.evaluacions.length > 0)?
	        				this.props.leccion.evaluacions.map(function(o){
								<ItemEvaluacion key={"E-"+o.id} evaluacion={o}/>
							}):<tr><td colSpan="3">No hay evaluaciones en esta sección.</td></tr>}
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
  	// propTypes: {
   //  	item: React.PropTypes.object.isRequired
  	// },
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
	componentDidMount: function() {
		var id = "dd"+this.props.item.id;
		$("body").append(
			"<ul id='"+id+"' class='dropdown-content'>"+
			"<li><a href='javascript:void(0)'>Agregar hijo</a></li>"+
			"<li><a href='javascript:void(0)'>Editar</a></li>"+
			"<li><a href='javascript:void(0)' class='accion-eliminar'>"+
			"Eliminar</a></li></ul>");
		$("ul#"+id+" .accion-eliminar").on("click", this.eliminar);
	},
	componentWillUnmount: function(){
		var id = "#dd"+this.props.item.id;
		$(id).remove();
	},
	render: function(){
		var modulos=<span>No hay modulos para este curso.</span>;
		if(this.props.item.modulos !== undefined && this.props.item.modulos.length > 0){
			var modulos = this.props.item.modulos.map(function(m){
				return (<ItemLeccion key={m.id} leccion={m} />);
			});
		}
		var divStyle={backgroundImage: "url("+this.props.item.imagen_url+")"};
		return (
			<div className="panel panel-curso">
				<div className="panel-heading">
					<div className="media">
						<a href={"#item-"+this.props.item.id} data-toggle="collapse" onClick={this.cargarCurso}>
						  	<div className="media-left" style={divStyle}>
						  	</div>
						  	<div className="media-body">
						    	<h4 className="media-heading">{this.props.item.nombre}</h4>
						   		<p className="descripcion">
						   			{this.acortarCadena(this.props.item.descripcion,100)}</p> 
						  	</div>
						</a>
					  	<div className="media-right">
					  		<a href="javascript:void(0)" className="accion dropdown-button" 
								data-activates={"dd"+this.props.item.id}>
								<i className="mdi-navigation-more-vert grey-text darken-2"></i>
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
	componentDidMount: function() {
		var id = "dd"+this.props.item.self.id,
			e = this.eliminar;
		$("body").append(
			"<ul id='"+id+"' class='dropdown-content'>"+
			"<li><a href='javascript:void(0)'>Agregar hijo</a></li>"+
			"<li><a href='javascript:void(0)'>Editar</a></li>"+
			"<li><a href='javascript:void(0)' class='eliminarNivel'>"+
			"Eliminar</a></li></ul>");
		$("ul#"+id+" .eliminarNivel").on("click", this.eliminar);
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