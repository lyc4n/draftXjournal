import React, { Component } from 'react';
import { Form, FormControl } from 'react-bootstrap';

class Toolbar extends Component{
  handleChange(e){
    let filter = e.target.value
    this.props.filterDrafts(filter)
  }

  render(){
    return(
      <div className='draft-listing-toolbar'>
        Draft listing toolbar
        <Form className='draft-filter'>
          <FormControl type='text' placeholder='Filter'
            onChange={this.handleChange.bind(this)}
            id='draft-filter__field'
            className='draft-filter__field'>
          </FormControl>
        </Form>
        <br/>
        <br/>
      </div>
    )
  }
}

export default Toolbar
