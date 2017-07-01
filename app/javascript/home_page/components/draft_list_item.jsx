import React, {Component} from 'react'
import Elapsed from 'elapsed'

class DraftListItem extends Component{
  draftPath(){
    return(`/drafts/${this.props.id}`)
  }
  elapsedTime(){
    let elapsed = new Elapsed(new Date(this.props.created_at), new Date());
    return(elapsed.optimal)
  }
  render(){
    let elapsed = new Date()
    return(
      <div className='draft-list-item panel'>
        <div className='draft-list-item__title'>
          <a href={this.draftPath()}>{this.props.title}</a>
        </div>
        <div className='draft-list-item__content-preview'>
          {this.props.content_preview}
        </div>
        <div className='draft-list-item__footer text-right'>
          <small className='draft-list-item__metadata'>
            {this.elapsedTime()}
          </small>
        </div>
      </div>)
  }
}

export default DraftListItem
