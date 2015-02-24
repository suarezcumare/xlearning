/**********************************************************************************/
/****************     Carga Academica Grupo                            ******************/
/*********************************************************************************/

/* Inicio myClase*/
 var CommentBoxCargaAcademicaFuturas = React.createClass({
     getInitialState: function() {
    return { data : [] };
  },

  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
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

      <div className="CommentBoxCargaAcademicaPasadas"> 
           <CommentListFuturas data={this.state.data} />
      </div>
    );
  }
});

var CommentListFuturas = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function (comment) {
      return (
        <CommentCargaAcademicaPasadas porcentaje={comment.porcentaje} fechaI={comment.fechaI} nombre={comment.nombre}  img={comment.img} fechaF={comment.fechaF} url={comment.url} codigo={comment.codigo} descripcion={comment.descripcion} objetivos={comment.objetivos} perfil={comment.perfil} prerequisitos={comment.prerequisitos} modal={comment.modal} >
          </CommentCargaAcademicaPasadas>
      );
    });
    return (
      <div className="commentListPasadas">
        {commentNodes}
      </div>
    );
  }
});


var converter = new Showdown.converter();
var CommentCargaAcademicaFuturas = React.createClass({
  render: function() {
   
    return (
      <div className="CommentCargaAcademicaFuturas">
                <div className="panel curso-actual">
                <div className="media">
                  <a className="media-left" href="#">
                    <img src={this.props.img} alt=""> </img>
                  </a>
                 
                   <div className="media-body">
                    <h5 className="media-heading">{this.props.nombre} </h5>
                    <div>
                      <div className="progress">
                      <div  className="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style={{"width": this.props.porcentaje}}>
                        <span className="sr-only">{this.props.porcentaje} Completado {this.props.porcentaje}</span>
                      </div>
                    </div>
                    <span className="fecha-inicio"> {this.props.fechaI} </span>
                    <span className="fecha-fin">{this.props.fechaF}</span>
                  </div>
                  <br></br>
                   <a className="text-uppercase" href={this.props.modal} > Información</a>
                   <a  className="btn btn-danger ingresar" href={this.props.url}>Ir a clases </a>
                  </div>

                </div>
              </div>

      </div>

           
    );
  }
});

var id = $("#idd").attr("class")

if (id == "Futuras"){

React.render(
  <CommentBoxCargaAcademicaFuturas url="/json/clases/generarClasesFuturas" />,
  document.getElementById('myClaseFuturas')
);

}

/* Fin myClase*/




/* Inicio myClase*/
 var CommentBoxCargaAcademicaPasadas = React.createClass({
     getInitialState: function() {
    return { data : [] };
  },

  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
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

      <div className="CommentBoxCargaAcademicaPasadas"> 
           <CommentListPasadas data={this.state.data} />
      </div>
    );
  }
});

var CommentListPasadas = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function (comment) {
      return (
        <CommentCargaAcademicaPasadas porcentaje={comment.porcentaje} fechaI={comment.fechaI} nombre={comment.nombre}  img={comment.img} fechaF={comment.fechaF} url={comment.url} codigo={comment.codigo} descripcion={comment.descripcion} objetivos={comment.objetivos} perfil={comment.perfil} prerequisitos={comment.prerequisitos} modal={comment.modal} >
          </CommentCargaAcademicaPasadas>
      );
    });
    return (
      <div className="commentListPasadas">
        {commentNodes}
      </div>
    );
  }
});


var converter = new Showdown.converter();
var CommentCargaAcademicaPasadas = React.createClass({
  render: function() {
   
    return (
      <div className="CommentCargaAcademicaPasadas">
                <div className="panel curso-actual">
                <div className="media">
                  <a className="media-left" href="#">
                    <img src={this.props.img} alt=""> </img>
                  </a>
                 
                   <div className="media-body">
                    <h5 className="media-heading">{this.props.nombre} </h5>
                    <div>
                      <div className="progress">
                      <div  className="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style={{"width": this.props.porcentaje}}>
                        <span className="sr-only">{this.props.porcentaje} Completado {this.props.porcentaje}</span>
                      </div>
                    </div>
                    <span className="fecha-inicio"> {this.props.fechaI} </span>
                    <span className="fecha-fin">{this.props.fechaF}</span>
                  </div>
                  <br></br>
                   <a className="text-uppercase" href={this.props.modal} > Información</a>
                   <a  className="btn btn-danger ingresar" href={this.props.url}>Ir a clases </a>
                  </div>

                </div>
              </div>

      </div>

           
    );
  }
});

var id = $("#idd").attr("class")

if (id == "Pasadas"){

React.render(
  <CommentBoxCargaAcademicaPasadas  url="/json/clases/generarClasesPasadas" />,
  document.getElementById('myClasePasadas')
);

}

/* Fin myClase*/







/* Inicio myClase*/
 var CommentBoxCargaAcademica = React.createClass({
     getInitialState: function() {
    return { data : [] };
  },

  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
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

      <div className="CommentBoxCargaAcademica"> 
           <CommentList data={this.state.data} />
      </div>
    );
  }
});

var CommentList = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function (comment) {
      return (
        <CommentCargaAcademica porcentaje={comment.porcentaje} fechaI={comment.fechaI} nombre={comment.nombre}  img={comment.img} fechaF={comment.fechaF} url={comment.url} codigo={comment.codigo} descripcion={comment.descripcion} objetivos={comment.objetivos} perfil={comment.perfil} prerequisitos={comment.prerequisitos} modal={comment.modal} >
          </CommentCargaAcademica>
      );
    });
    return (
      <div className="commentList">
        {commentNodes}
      </div>
    );
  }
});


var converter = new Showdown.converter();
var CommentCargaAcademica = React.createClass({
  render: function() {
   
    return (
      <div className="CommentCargaAcademica">
                <div className="panel curso-actual">
                <div className="media">
                  <a className="media-left" href="#">
                    <img src={this.props.img} alt=""> </img>
                  </a>
                 
                   <div className="media-body">
                    <h5 className="media-heading">{this.props.nombre} </h5>
                    <div>
                      <div className="progress">
                      <div  className="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style={{"width": this.props.porcentaje}}>
                        <span className="sr-only">{this.props.porcentaje} Completado {this.props.porcentaje}</span>
                      </div>
                    </div>
                    <span className="fecha-inicio"> {this.props.fechaI} </span>
                    <span className="fecha-fin">{this.props.fechaF}</span>
                  </div>
                  <br></br>
                   <a className="text-uppercase" href={this.props.modal} > Información</a>
                   <a  className="btn btn-danger ingresar" href={this.props.url}>Ir a clases </a>
                  </div>

                </div>
              </div>

      </div>

           
    );
  }
});

var id = $("#idd").attr("class")

if (id == "Actuales"){

React.render(
  <CommentBoxCargaAcademica  url="/json/clases/generarClasesActuales" />,
  document.getElementById('myClaseActuales')
);
}
/* Fin myClase*/





/* Inicio ListaDeseos*/
 var CommentBoxListaDeseo = React.createClass({
     getInitialState: function() {
    return { data : [] };
  },

  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
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

      <div className="CommentBoxListaDeseo"> 
           <CommentListDeseos data={this.state.data} />
      </div>
    );
  }
});

var CommentListDeseos = React.createClass({
  render: function() {
    var commentNodesListaDeseos = this.props.data.map(function (comment) {
      return (
        <CommentListaDeseos  nombre={comment.nombre}  img={comment.img} url={comment.url} codigo={comment.codigo} descripcion={comment.descripcion}  >
          </CommentListaDeseos>
      );
    });
    return (
      <div className="commentListDesos">
        {commentNodesListaDeseos}
      </div>
    );
  }
});


var converter = new Showdown.converter();
var CommentListaDeseos = React.createClass({
  render: function() {
   
    return (
      <div className="CommentListaDeseos">
        <li>
            <div className="card">
                  <div className="card-image">
                    <div className="favoritear fav" data-toggle="tooltip" data-placement="bottom" title="Quiero hacer este curso">
                          <a href="javascript:void(0)">
                            <i className="fa fa-heart fa-2x grey-text"></i>
                            <i className="fa fa-heart fondo red-text darken-2"></i>
                          </a>
                      </div>
                    <img src={this.props.img} > </img>
                    <span className="card-title">{this.props.nombre} </span>
                  </div>  
                  <div className="card-content">
                    <p>  </p>
                  </div>
                  <div className="card-action">
                    <a href={this.props.url} >Más información</a>
                  </div>
              </div>
          </li>

      </div>

           
    );
  }
});


var id = $("#ididdeseos").attr("class")
if (id == "ididdeseos"){

React.render(
  <CommentBoxListaDeseo  url="/json/clases/generarListaDeseos" />,
  document.getElementById('myListaDeseos')
);

}
/* Fin ListaDeseos*/


/* Inicio Recomendados para ti*/
 var CommentBoxListaRecomendados = React.createClass({
     getInitialState: function() {
    return { data : [] };
  },

  componentDidMount: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
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

      <div className="CommentBoxListaRecomendados"> 
           <CommentListRecomendados data={this.state.data} />
      </div>
    );
  }
});

var CommentListRecomendados = React.createClass({
  render: function() {
    var commentNodesListaRecomendados = this.props.data.map(function (comment) {
      return (
        <CommentListaRecomendados  nombre={comment.nombre}  img={comment.img} url={comment.url} codigo={comment.codigo} descripcion={comment.descripcion}  >
          </CommentListaRecomendados>
      );
    });
    return (
      <div className="commentListRecomendados">
        {commentNodesListaRecomendados}
      </div>
    );
  }
});


var converter = new Showdown.converter();
var CommentListaRecomendados = React.createClass({
  render: function() {
   
    return (
      <div className="CommentListaRecomendados">
        <li>
            <div className="card">
                  <div className="card-image">
                    <div className="favoritear fav" data-toggle="tooltip" data-placement="bottom" title="Quiero hacer este curso">
                          <a href="javascript:void(0)">
                            <i className="fa fa-heart fa-2x grey-text"></i>
                            <i className="fa fa-heart fondo red-text darken-2"></i>
                          </a>
                      </div>
                    <img src={this.props.img} > </img>
                    <span className="card-title">{this.props.nombre} </span>
                  </div>  
                  <div className="card-content">
                    <p>   </p>
                  </div>
                  <div className="card-action">
                    <a href={this.props.url}> Más información</a>
                  </div>
              </div>
          </li>

      </div>

           
    );
  }
});

var id = $("#ididrecomendados").attr("class")
if (id == "ididrecomendados"){


React.render(
  <CommentBoxListaRecomendados  url="/json/clases/generarListaRecomendados" />,
  document.getElementById('myListaRecomendados')
);

}
/* Fin Recomendados para ti*/
