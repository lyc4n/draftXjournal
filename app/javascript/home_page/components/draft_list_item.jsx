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
  renderTagList(){
    let tagListItems = this.props.tag_list.map((tag, index) =>{
      return(<li key={index} className='tag-list__item'>{tag}</li>)
    })

    if(tagListItems.length){
      return(<ul className='tag-list'>{tagListItems}</ul>)
    }else{
      return(<small className='pull-left'>No tag</small>)
    }
  }
  render(){
    return(
      <div className='draft-list-item panel'>
        <div className='draft-list-item__title'>
          <a href={this.draftPath()}>{this.props.title}</a>
        </div>
        <div className='draft-list-item__content-preview'>
          {this.props.content_preview}
        </div>
        <div className='draft-list-item__footer text-right'>
          {this.renderTagList()}
          <small className='draft-list-item__metadata'>
            {this.elapsedTime()}
          </small>
        </div>
      </div>)
  }
}

export default DraftListItem
