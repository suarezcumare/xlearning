$(function() {
  
	var CommentBox = React.createClass({
  render: function() {
    return (
      <div className="commentBox">
      			
      			<div className="panel curso-actual">
				<div className="media">
				  <a className="media-left" href="#">
				    <img src="/assets/clases-imagen.jpg" alt=""> </img>
				  </a>
				 
				   <div className="media-body">
				    <h5 className="media-heading">API de Google Maps</h5>
				    <div>
					    <div className="progress">
						  <div  className="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style={{"width":"35%"}}>
						    <span className="sr-only">60% Completado</span>
						  </div>
						</div>
						<span className="fecha-inicio"> Nov, 12 de 2014</span>
						<span className="fecha-fin">Feb, 13 de 2015</span>
					</div>
					<br></br>
					 <a className="modal-trigger text-uppercase" href="#modal1"> Información</a>

					 
					 <a  className="btn btn-danger ingresar" href="clases/1">Ir a clases </a>
				  </div>

				</div>
			</div>

      
      </div>
    );
  }
});
React.render(
  <CommentBox />,
  document.getElementById('myClases')
);


  
})

