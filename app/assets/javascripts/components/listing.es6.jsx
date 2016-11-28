class Listing extends React.Component{
  constructor(){
    super();
    this.state = { cars: []
    }
  }

  componentDidMount(){
    this.setState({cars: this.props.cars})
  }


  render(){
    var count = this.props.cars.length
    var ranger = 25
    return(
      <div className="car-list">
        {
          this.state.cars.slice(0,25).map((car, i)=> {
            return (<Row dataId={i} key={i} car={car} />)
          })
        }
      </div>
    );
  }
}
