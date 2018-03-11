import React, {Component} from 'react'
import EntryItem from './entry_item'
import {Tabs, Tab} from 'react-bootstrap'

class Journal extends Component{

  constructor(props){
    super(props)
    this.state = {
      contextDay:          new Date,
      initialEntries:      this.props.initialEntries,
      initialMonthEntries: this.props.initialMonthEntries
    }
  }

  componentDidMount(){
  }

  renderHeader(){
    return(<div className='draft-list__header'>
      <h3 className='header'>
        My Journal - 2017
      </h3>
      <hr />
      <div className='clearfix'></div>
    </div>)
  }

  renderEntryList(){
    const items = $.map(this.state.initialEntries, (entry)=>{
      return <EntryItem key={entry.id} {...entry} />
    })

    return(
      <div className='entry-list-container'>
        <ul className='entry-list'>
          { items }
        </ul>
      </div>)
  }

  renderMonthEntryList(){
    const items = $.map(this.state.initialMonthEntries, (entry)=>{
      return <EntryItem key={entry.id} {...entry} />
    })

    return(
      <div className='entry-list-container'>
        <ul className='entry-list'>
          { items }
        </ul>
      </div>)
  }

  renderEntryTabs(){
    return(
      <Tabs defaultActiveKey={1} id="uncontrolled-tab-example">
        <Tab eventKey={1} title="Day Entries">
          {this.renderEntryList()}
        </Tab>
        <Tab eventKey={2} title="Month Entries">
          {this.renderMonthEntryList()}
        </Tab>
      </Tabs>
    )
  }

  render(){
    return(<div className='home-page--content col-sm-9'>
      {this.renderHeader()}
      {this.renderEntryTabs()}
    </div>)
  }
}

export default Journal
