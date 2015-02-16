
/**********************************************************************************/
/****************     Clase Usuario                            ******************/
/*********************************************************************************/

/* Inicio Panel curso (mis cursos) */
 var CommentBoxListaMisCursos = React.createClass({
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

      <div className="CommentBoxListaMisCursos"> 
           <CommentListMisCursos data={this.state.data} />
      </div>
    );
  }
});

var CommentListMisCursos = React.createClass({
  render: function() {
    var commentNodesListaMisCursos = this.props.data.map(function (comment) {
      return (
        <CommentListaMisCursos  nombre={comment.nombre}  img={comment.img} url={comment.url} codigo={comment.codigo} descripcion={comment.descripcion}  >
          </CommentListaMisCursos>
      );
    });
    return (
      <div className="commentListMisCursos">
        {commentNodesListaMisCursos}
      </div>
    );
  }
});


var converter = new Showdown.converter();
var CommentListaMisCursos = React.createClass({
  render: function() {
   
    return (
      <div className="CommentListaMisCursos">
        
           <div className="col s12 m6 l5">
              <div className="card white">
                <div className="card-image">
                  <img className="responsive-img" src="/assets/curso3.jpg"></img>
                </div>
                <div className="card-content">
                  <span className="card-title grey-text darken-3">{this.props.nombre}</span>
                </div>
              </div>
            </div>

      </div>

           
    );
  }
});


React.render(
  <CommentBoxListaMisCursos  url="/json/clases/generarClasesActuales" />,
  document.getElementById('myListaMisCursos')
);

/* Fin Panel curso (mis cursos) */

