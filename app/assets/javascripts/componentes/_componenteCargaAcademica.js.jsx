/**********************************************************************************/
/****************     Carga Academica Grupo                            ******************/
/*********************************************************************************/

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
        <CommentCargaAcademica fechaI={comment.fechaI} nombre={comment.nombre}  img={comment.img} fechaF={comment.fechaF} url={comment.url} codigo={comment.codigo} descripcion={comment.descripcion} objetivos={comment.objetivos} perfil={comment.perfil} prerequisitos={comment.prerequisitos} >
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
                    <img src="/assets/clases-imagen.jpg" alt=""> </img>
                  </a>
                 
                   <div className="media-body">
                    <h5 className="media-heading">{this.props.nombre} </h5>
                    <div>
                      <div className="progress">
                      <div  className="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style={{"width":"35%"}}>
                        <span className="sr-only">60% Completado</span>
                      </div>
                    </div>
                    <span className="fecha-inicio"> {this.props.fechaI} </span>
                    <span className="fecha-fin">{this.props.fechaF}</span>
                  </div>
                  <br></br>
                   <a className="modal-trigger text-uppercase" href="#modal1"> Información</a>
                   <a  className="btn btn-danger ingresar" href={this.props.url}>Ir a clases </a>
                  </div>

                </div>
              </div>


            <div id="modal1" className="modal">
                <a href="#" style={{"float":"right"}} className="waves-effect btn-flat modal-close"><i className="mdi-content-clear"></i></a>
              
                  <h4 className="text-primary pad15 pad30-h">{this.props.nombre}</h4>

              <p className="pad15 pad15-h"><span> <b> Descripción: </b> </span> {this.props.descripcion} </p>
              <p className="pad15 pad15-h"><span> <b> Objetivos: </b> </span> {this.props.objetivos}</p>
               <p className="pad15 pad15-h">{this.props.perfil}</p>
              <p className="pad15 pad15-h">{this.props.prerequisitos} </p>
            </div>


      </div>

           
    );
  }
});


React.render(
  <CommentBoxCargaAcademica  url="/json/clases/generarClasesActuales" />,
  document.getElementById('myClaseActual')
);

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
                    <img src="assets/curso1.jpg" className="img-responsive"> </img>
                    <span className="card-title">{this.props.nombre} </span>
                  </div>  
                  <div className="card-content">
                    <p>  </p>
                  </div>
                  <div className="card-action">
                    <a href="javascript:void(0)">Más información</a>
                  </div>
              </div>
          </li>

      </div>

           
    );
  }
});


React.render(
  <CommentBoxListaDeseo  url="/json/clases/generarListaDeseos" />,
  document.getElementById('myListaDeseos')
);

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
                    <img src="assets/curso1.jpg" className="img-responsive"> </img>
                    <span className="card-title">{this.props.nombre} </span>
                  </div>  
                  <div className="card-content">
                    <p>   </p>
                  </div>
                  <div className="card-action">
                    <a href="javascript:void(0)"> Más información</a>
                  </div>
              </div>
          </li>

      </div>

           
    );
  }
});


React.render(
  <CommentBoxListaRecomendados  url="/json/clases/generarListaRecomendados" />,
  document.getElementById('myListaRecomendados')
);

/* Fin Recomendados para ti*/
