/**********************************************************************************/
/****************     Clases  Grupo                            ******************/
/*********************************************************************************/

/* Inicio myClase*/
 var CommentBoxClaseNotificacionesEvaluaciones = React.createClass({
     getInitialState: function() {
    return { data : [] };
  },

  componentDidMount: function() {
    $.ajax({

      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: "number="+ $("#ClasesNotificacionesEvaluaciones").attr("class"),
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  render: function() {
   
    return (

      <div className="CommentBoxClasesNotificacionesEvaluaciones"> 
           <CommentListClasesNotificacionesEvaluaciones data={this.state.data} />
      </div>
    );
  }
});

var CommentListClasesNotificacionesEvaluaciones = React.createClass({
  render: function() {
    var commentNodesEvaluaciones = this.props.data.map(function (comment) {
      return (
        <CommentClasesNotificacionesEvaluaciones descripcion={comment.descripcion} nombre={comment.nombre} fecha={comment.fecha} hora={comment.hora}   url={comment.url} >
          </CommentClasesNotificacionesEvaluaciones>
      );
    });
    return (
      <div className="commentListClasesNotificacionesEvaluaciones">
        {commentNodesEvaluaciones}
      </div>
    );
  }
});


var converter = new Showdown.converter();
var CommentClasesNotificacionesEvaluaciones = React.createClass({
  render: function() {
   
    return (
      <div className="CommentClasesNotificacionesEvaluaciones">
                
          
          <li>
             <p className="panel-der"> <a className="text-muted" href={this.props.url}> {this.props.nombre} </a>: {this.props.descripcion} 
                <br></br>
                {this.props.fecha}, {this.props.hora}.
            </p>
          </li>


      </div>

           
    );
  }
});


var id = $("#ididnotivea").attr("class")

if (id == "ididnotivea"){

React.render(
  <CommentBoxClaseNotificacionesEvaluaciones  url="/json/clases/generarClasesNotificacionesEvaluaciones" />,
  document.getElementById('ClasesNotificacionesEvaluaciones')
);

}
/* Fin notificacionesEvaluciones*/


 //Inicio notificacionesDiscuciones

 var CommentBoxClaseNotificacionesDiscuciones = React.createClass({
     getInitialState: function() {
    return { data : [] };
  },

  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: "number=" + $("#ClasesNotificacionesDiscuciones").attr("class"),
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  render: function() {
   
    return (

      <div className="CommentBoxClasesNotificacionesDiscuciones"> 
           <CommentListClasesNotificacionesDiscuciones data={this.state.data} />
      </div>
    );
  }
});

var CommentListClasesNotificacionesDiscuciones = React.createClass({
  render: function() {
    var commentNodesDiscuciones = this.props.data.map(function (comment) {
      return (
        <CommentClasesNotificacionesDiscuciones usuario={comment.usuario} nombre={comment.nombre} fecha={comment.fecha}  url={comment.url}  >
          </CommentClasesNotificacionesDiscuciones>
      );
    });
    return (
      <div className="commentListClasesNotificacionesDiscuciones">
        {commentNodesDiscuciones}
      </div>
    );
  }
});


var converter = new Showdown.converter();
var CommentClasesNotificacionesDiscuciones = React.createClass({
  render: function() {
   
    return (
      <div className="CommentClasesNotificacionesDiscuciones">
              <li>
                <p className="panel-der"> <a className="text-muted" href={this.props.url}> {this.props.nombre} </a> 
                <br></br>
                Comento {this.props.usuario} el {this.props.fecha}, {this.props.hora}.
              </p>
          </li>
          
      </div>

           
    );
  }
});

var id = $("#ididnotidis").attr("class")

if (id == "ididnotidis"){

React.render(
  <CommentBoxClaseNotificacionesDiscuciones  url="/json/clases/generarClasesNotificacionesDiscuciones" />,
  document.getElementById('ClasesNotificacionesDiscuciones')
);
}
  //Fin notificacionesEvaluciones */




/* Inicio NotificacionesCurso*/
 var CommentBoxClaseNotificaciones = React.createClass({
     getInitialState: function() {
    return { data : [] };
  },

  componentDidMount: function() {
    $.ajax({
     url: this.props.url,
      dataType: 'json',
      type: 'POST',
      data: "number=" + $("#ClasesNotificaciones").attr("class"),
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  render: function() {
   
    return (

      <div className="CommentBoxClasesNotificaciones"> 
           <CommentListClasesNotificaciones data={this.state.data} />
      </div>
    );
  }
});

var CommentListClasesNotificaciones = React.createClass({
  render: function() {
    var commentNodesNotificaciones = this.props.data.map(function (comment) {
      return (
        <CommentClasesNotificaciones descripcion={comment.descripcion} nombre={comment.nombre} fecha={comment.fecha} hora={comment.hora} dia={comment.dia} usuario={comment.usuario}  url={comment.url} >
          </CommentClasesNotificaciones>
      );
    });
    return (
      <div className="commentListClasesNotificaciones">
        {commentNodesNotificaciones}
      </div>
    );
  }
});


var converter = new Showdown.converter();
var CommentClasesNotificaciones = React.createClass({
  render: function() {
   
    return (
      <div className="CommentClasesNotificaciones">
                
        
        <div className="media">
            <h5> Mensaje </h5>

           <div className="media-left">
              <div className="notificacion-fecha btn-primary">
                {this.props.dia}
                <div className="anio">2014</div>
              </div>
             </div>
              <div className="media-body">
                {this.props.nombre}: {this.props.descripcion}
              </div>
              <br></br>
           <span> Enviado por {this.props.usuario}, a las {this.props.hora} </span>
          </div>
            
        <hr></hr>


      </div>

           
    );
  }
});


var id = $("#ididnotifeva").attr("class")

if (id == "ididnotifeva"){

React.render(
  <CommentBoxClaseNotificaciones  url="/json/clases/generarClasesNotificaciones" />,
  document.getElementById('ClasesNotificaciones')
);

}
/* Fin NotificacionesCurso*/