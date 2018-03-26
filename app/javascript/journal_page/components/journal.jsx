import React, {Component} from 'react'
import EntryItem from './entry_item'
import {Tabs, Tab} from 'react-bootstrap'
import moment from 'moment'

import 'react-dates/initialize';
import { DateRangePicker, SingleDatePicker, DayPickerRangeController, DayPicker } from 'react-dates';
import 'react-dates/lib/css/_datepicker.css';

class Journal extends Component{

  constructor(props){
    super(props)
    this.state = {
      contextDate:  moment(this.props.contextDate),
      dayEntries:   this.props.dayEntries,
      monthEntries: this.props.monthEntries,
      datePickerOn: false
    }
  }

  toggleDatePickerDropdown(){
    let datePickerOn = !this.state.datePickerOn
    this.setState({datePickerOn})
  }

  handleDayChange(selectedDay){
    this.setState({contextDate: selectedDay, datePickerOn: false}, this.fetchEntries.bind(this))
  }

  fetchEntries(){
    const {contextDate} = this.state
    $.ajax({
      url: `/journal/${contextDate.month() + 1}/${contextDate.date()}`,
      format: 'json',
      success: ((journalData) => {
        const {dayEntries, monthEntries} = journalData
        this.setState({dayEntries, monthEntries})
        console.log('success', journalData)
      }),
      complete: (() => {
        console.log('complete')
      }),
      error: (() => {
        console.log('error')
      })
    })
  }

  dateDoesNotBelong(date){
    return date.year() != this.state.contextDate.year()
  }

  renderDatePicker(){
    if(this.state.datePickerOn)
      return(
        <div className='journal__datepicker-dropdown'>
          <SingleDatePicker
            numberOfMonths={1}
            isOutsideRange={this.dateDoesNotBelong.bind(this)}
            anchorDirection={'right'}
            date={this.state.contextDate}
            onDateChange={this.handleDayChange.bind(this)}
            focused={true}
            onFocusChange={({ focused }) => this.setState({ focused })}
          />
        </div>
      )
  }
  renderHeader(){
    return(<div className='journal__header'>
      <h3 className='header'>
        My Journal - {this.props.journal.year}
        <span className='pull-right journal__datepicker-dropdown-toggler' onClick={this.toggleDatePickerDropdown.bind(this)}>
           {this.state.contextDate.format('ddd, MMM D')}
           &nbsp;
           <i className='fa fa-angle-down'></i>
        </span>
        {this.renderDatePicker()}
      </h3>
      <hr />

      <div className='clearfix'></div>
    </div>)
  }

  renderEntryList(){
    const items = $.map(this.state.dayEntries, (entry)=>{
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
    const items = $.map(this.state.monthEntries, (entry)=>{
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
