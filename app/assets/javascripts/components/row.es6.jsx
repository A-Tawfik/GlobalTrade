class Row extends React.Component{

  render(){
    return(
      <div className={"car row " + (this.props.dataId % 2 === 0 ? "even" : "odd")}>
        <div className="id">
          {this.props.car.id}
        </div>
        <div className="image_thumbnail">
          <img alt={this.props.car.lot_number} src={this.props.car.image_thumbnail}/>
        </div>
        <div className="lot_number">
          {this.props.car.lot_number}
        </div>
        <div className="year">
          {this.props.car.year}
        </div>
        <div className="make">
          {this.props.car.make}
        </div>
        <div className="model_detail">
          {this.props.car.model_detail}
        </div>
      </div>
    )}
}
