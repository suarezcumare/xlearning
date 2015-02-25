var DialogoRoles = React.createClass({
	getInitialState: function() {
    return {
    		roles: []
    	};
  	},
    componentDidMount: function() {
      $.ajax({
        url: "/rols",
        type:"get",
        dataType: 'json',
        success: function(data) {
          this.setState({roles: data});
        }.bind(this),
        error: function(xhr, status, err) {
          console.error(this.props.url, status, err.toString());
        }.bind(this)
      });
    },
  	render:function(){
  		var items = this.state.roles.map(function (r) {
        return (
          <li>
            <a href="javascript:void(0)" data-rol={r.id}>
              <h5>{r.nombre}</h5>
              <p>{r.descripcion}</p>
            </a>
          </li>
        );
      });
  		return (
  			<div id="form-cambio-roles" className="modal">
          <h4>Cambiar el rol</h4>
          <ul>
            {items}
          </ul>
        </div>
  		);
  	}
});