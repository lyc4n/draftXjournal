import React, {Component} from 'react'

class Sidebar extends Component{
  render(){
    return(<div className='home-page__sidebar col-sm-3'>
      <ul className='list-group'>
        <li className='list-group-item home-page__sidebar-list-item'>
          <span className='badge'>{this.props.draftsCount}</span>
          <a href='/'>Drafts</a>
        </li>
        <li className='list-group-item'>
          My Journal
        </li>
        {/* <li className='list-group-item'> */}
        {/*   <span className='badge'>1</span> */}
        {/*   Quotes */}
        {/* </li> */}
        {/* <li className='list-group-item'> */}
        {/*   <span className='badge'>1</span> */}
        {/*   Albums */}
        {/* </li> */}
      </ul>
    </div>)
  }
}

export default Sidebar
