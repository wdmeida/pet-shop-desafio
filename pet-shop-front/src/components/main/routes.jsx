import React from 'react'
import { Router, Route, Redirect, hashHistory } from 'react-router'

import Pet from '../pet/pet'
import About from '../about/about'

export default props => (
  <Router history={hashHistory}>
    <Route path='/pets' component={Pet} />
    <Route path='/about' component={About} />
    <Redirect from='*' to='/pets' />
  </Router> 
)