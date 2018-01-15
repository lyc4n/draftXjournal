import React, {Component} from 'react'

class EntryItem extends Component{
  render(){
    return(
      <li className='entry-item'>
        {this.props.title}
      </li>
    )
  }
}

export default EntryItem
