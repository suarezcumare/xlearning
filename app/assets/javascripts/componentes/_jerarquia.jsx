var valores = {
                id:"",
                nombre: "",
                descripcion: ""
              };
var ItemNivel = React.createClass({
	render: function(){
		return (
		  <li>
		  	<div className="collapsible">
		  		<div className="campo-nombre collapsible-header">
            <input type="hidden" name="estructura_oferta_academicas[][id]" 
              defaultValue={this.props.nivel.id}/>
            <input type="hidden" name="estructura_oferta_academicas[][parent_id]"
              defaultValue={this.props.nivel.parent_id}/>
		  			<div className="input-group">
		  				<input type="text" name="estructura_oferta_academicas[][nombre]" 
                className="form-control" placeholder="Nuevo nivel" value={this.props.nivel.nombre}/>
          		<span className="input-group-addon" id="basic-addon2">
          			<a href="javascript:void(0)" onClick={this.props.callbacks[0].bind(this,
                    this.props.i,this.props.j)}>
                  <i className="mdi-content-clear"></i></a>
          		</span>
          	</div>
          </div>
          <div className="campo-descripcion collapsible-body">
          	<textarea placeholder="Coloca aquí la descripción" 
          		type="text" name="estructura_oferta_academicas[][descripcion]" 
              defaultValue={this.props.nivel.descripcion}>
         		</textarea>
         	</div>
        </div>
      </li>
		);
	}
});
var JerarquiaBox = React.createClass({
	render: function(){
    var callbacks = this.props.callbacks,
        i = this.props.i;
    var items = this.props.niveles.map(function (item, j) {
      return (
        <ItemNivel nivel={item} key={item.id} callbacks = {callbacks} 
          j={j} i={i} />
      );
    });
		return (
	  	<form action="/estructura_oferta_academicas" method="">
	  		<div className="panel-heading">
    			<a href="javascript:void(0)" className="btn btn-primary" 
            onClick={ callbacks[1].bind(this,i) }>agregar nivel</a>&nbsp;
    			<a href="javascript:void(0)" className="btn btn-success guardar"
            >Guardar</a>&nbsp;
          <a href="javascript:void(0)" className="btn btn-danger eliminar"
            onClick = {callbacks[0].bind(this,i,undefined) }>Eliminar</a>
    		</div>
    		<div className="panel-body jerarquia">
    			<ul className="niveles" ref="lista_niveles">
            {items}
          </ul>
    		</div>
    	</form>
		);
	}
});

var ListaJerarquia = React.createClass({
  getInitialState: function() {
    return {
      data: []
    };
  },
  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type:"get",
      success: function(data) {
        var jerarquias = data.map(function (e) {
          return (
            {id: e[0].id, data: e}
          );
        });
        //console.log(jerarquias);
        this.setState({data: jerarquias});
        //console.log(this.state.data);
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  handleDelete: function(i, j){
    var state = this.state.data;
    var url = this.props.url;
    var texto = null;
    if(j === undefined)
      texto = "Se eliminará permanentemente la jerarquía.";
    else if(state[i].data.length < 2) 
      texto = "Eliminar este nivel causará que se elimine permanentemente la jerarquía.";
    else
      texto = "Eliminar este nivel permanentemente de la jerarquía.";
    swal({   
        title: "¿Estás seguro?",
        text: texto,
        type: "warning",
        showCancelButton: true,
        confirmButtonText: "Si",
        cancelButtonText: "Cancelar"
      },
      function(){
        if(j === undefined || state[i].data.length < 2){
          url = url.concat("/"+state[i].id+"/true");
          state.splice(i,1);
        }else{
          if(state[i].data.length - 1 != j)
            state[i].data[j+1].parent_id = state[i].data[j].parent_id;
          url = url.concat("/"+state[i].data[j].id+"/false");
          state[i].data.splice(j,1);
        }
        $.ajax({
          type:"DELETE",
          url: url,
          success: function(){ this.setState({data: state}) }
        });
      });
    
  },
  handleAddLevel: function (i) {
    var state = this.state.data;
    //var nuevo = valores;
    //nuevo.parent_id = state[i].data[-1].id;
    state[i].data.push(valores);
    this.setState({
      data: state
    });
    console.log(state);
  },
  handleAdd: function(e){
    var state = this.state.data;
    state.unshift({data:[valores]});
    this.setState({data: state});
    console.log(state);
  },
  handleSave:function(f, i){

  },
  render: function(){
    var callbacks = [this.handleDelete, this.handleAddLevel];
    var jerarquias = this.state.data.map(function (jerarquia, i) {
      return (
        <div className="panel">
          <JerarquiaBox niveles={jerarquia.data} i={i} callbacks={callbacks} key={i}/>
        </div>
      );
    })  ;
    return (
      <div>
      <a href="javascript:void(0)" className="btn large btn-primary"
        onClick={this.handleAdd}>Agregar jerarquía</a>
      {jerarquias}
      </div>
    );
  }
});