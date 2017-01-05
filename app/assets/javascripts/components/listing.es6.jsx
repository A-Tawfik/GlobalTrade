class Listing extends React.Component{
  constructor(){
    super();
    this.state = { cars: [],
                  data: ""
    }
  }

  componentDidMount(){
    this.setState({cars: this.props.cars})
  }


  render(){
    return(
      <div className="car-list">
        {
          this.state.cars.map((car, i)=> {
            return (<Row dataId={i} key={i} car={car} />)
          })
        }
      </div>
    );
  }
}
