import React, {Component} from 'react'
import ReactDOM from 'react-dom'
import Sidebar  from 'shared/sidebar'
import Journal  from './journal'

class JournalPage extends Component{
  render(){
    return(<div>
        <Sidebar />
        <Journal {...this.props}/>
      </div>
    )
  }
}

const JournalPageRoot = {
  initialize: function(){
    let root         = document.getElementById('journal-page')
    let dayEntries   = JSON.parse(root.dataset['dayEntries'])
    let monthEntries = JSON.parse(root.dataset['monthEntries'])

    if(root){
      ReactDOM.render(<JournalPage initialEntries={dayEntries}
                                   initialMonthEntries={monthEntries}
                                   contextDate={new Date}/>, root)
    }
  }
}


export default JournalPageRoot
