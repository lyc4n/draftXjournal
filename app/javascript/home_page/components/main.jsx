import React, {Component} from 'react'
import ReactDOM from 'react-dom'
import Sidebar  from './sidebar'
import DraftList  from './draft_list'
import Fuse from 'fuse.js'

class HomePage extends Component{
  constructor(props){
    super(props)
    this.state = {
      drafts: props.drafts,
      displayDrafts: props.drafts,
      loadingDrafts: false
    }
  }

  totalDraftsCount(){
    return(this.state.drafts.length)
  }

  filterDrafts(filterText){
    let {drafts}  = this.state

    if(!filterText){
      this.setState({displayDrafts: drafts})
      return
    }

    let filterOptions = {
        caseSensitive: false,
        shouldSort: true,
        threshold: 0.3,
        location: 0,
        distance: 100,
        maxPatternLength: 32,
        minMatchCharLength: 1,
        keys: [
          'title',
          'content_preview'
        ]
    };

    let fuse    = new Fuse(drafts, filterOptions)
    let results = fuse.search(filterText)//.map((result) => {return(result.item)})
    this.setState({displayDrafts: results})
  }

  render(){
    return(<div>
      <Sidebar draftsCount={this.totalDraftsCount()}/>
      <DraftList filterDrafts={this.filterDrafts.bind(this)} drafts={this.state.displayDrafts}/>
    </div>)
  }
}
const HomePageRoot = {
  initialize: function(){
    let root = document.getElementById('home-page')
    if(root){
      let drafts = JSON.parse(root.dataset.drafts)
      ReactDOM.render(<HomePage drafts={drafts} />, root)
    }
  }
}


export default HomePageRoot
