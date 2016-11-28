class Row extends React.Component{

  render(){
    return(
      <div className={"car row " + (this.props.dataId % 2 === 0 ? "even" : "odd")}>
        <img alt={this.props.car.lot_number} src={"http://" + this.props.car.image_thumbnail}/>
      </div>
    )}
}
