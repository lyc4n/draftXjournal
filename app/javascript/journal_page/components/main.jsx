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
    let root            = document.getElementById('journal-page')
    let journalPageData = JSON.parse(root.dataset['journalPage'])
    let journal         = journalPageData.journal
    let dayEntries      = journalPageData.dayEntries
    let monthEntries    = journalPageData.monthEntries
    let contextDate     = new Date(journalPageData.contextDate)

    if(root){
      ReactDOM.render(<JournalPage dayEntries={dayEntries}
                                   monthEntries={monthEntries}
                                   journal={journal}
                                   contextDate={contextDate}/>, root)
    }
  }
}


export default JournalPageRoot
