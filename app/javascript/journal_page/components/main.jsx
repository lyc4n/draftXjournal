import React, {Component} from 'react'
import ReactDOM from 'react-dom'
import Sidebar  from 'shared/sidebar'
import Journal  from './journal'

class JournalPage extends Component{
  render(){
    return(<div>
        <Sidebar />
        <Journal dayEntries={this.props.dayEntries}
                 monthEntries={this.props.monthEntries} />
      </div>
    )
  }
}

const JournalPageRoot = {
  initialize: function(){
    let root = document.getElementById('journal-page')
    if(root){
      let dayEntries   = JSON.parse(root.dataset.dayEntries)
      let monthEntries = JSON.parse(root.dataset.monthEntries)
      ReactDOM.render(<JournalPage dayEntries={dayEntries}
                                   monthEntries={monthEntries}/>, root)
    }
  }
}


export default JournalPageRoot
