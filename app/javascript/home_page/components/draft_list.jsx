import React, {Component} from 'react'
import DraftListItem from './draft_list_item'

class DraftList extends Component{

  renderHeader(){
    return(<div className='draft-list__header'>
      <h3 className='header'>
        Your Drafts
        <a className='btn btn-primary btn-xs pull-right' href='/drafts/new'>New draft</a>
      </h3>
      <hr />
      <div className='clearfix'></div>
    </div>)
  }

  renderList(){
    let draftsView = this.props.drafts.map(function(draft){
        return(<DraftListItem {...draft} key={draft.id}/>)
    })

    return(<div className='draft-list'>{draftsView}</div>)
  }

  render(){
    return(<div className='home-page--content col-sm-9'>
      {this.renderHeader()}
      {this.renderList()}
    </div>)
  }
}

export default DraftList
