var Cards = React.createClass({

  render: function() {
    return (
      <main className="row">
        {this.props.cards.map(function(item){
          return(
            <article className="col-md-6 col-xs-12" key = {item.id}>
              <div className="card">
                <h1>{item.title}</h1>
                <p>{item.content}</p>
                <h4>{item.location}</h4>
                <h4>{item.pay}</h4>
                <h5>{item.created_at}</h5>
              </div>
            </article>
          )
        })}
      </main>
  );

  }
});
