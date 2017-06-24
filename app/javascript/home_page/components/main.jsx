import React, {Component} from 'react'
import ReactDOM from 'react-dom'
import Sidebar  from './sidebar'
import DraftList  from './draft_list'

class HomePage extends Component{
  constructor(props){
    super(props)
    this.state = { drafts: props.drafts,
      loadingDrafts: false
    }
  }

  totalDraftsCount(){
    return(this.state.drafts.length)
  }

  render(){
    return(<div>
      <Sidebar draftsCount={this.totalDraftsCount()}/>
      <DraftList drafts={this.state.drafts}/>
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
