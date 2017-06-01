import 'modules/bootstrap/dist/css/bootstrap.min.css'
import 'modules/font-awesome/css/font-awesome.min.css'
import 'modules/react-bootstrap-table/dist/react-bootstrap-table.min.css'

import React from 'react'
import Menu from '../template/menu'
import Routes from './routes'

export default props => (
  <div className='container'>
    <Menu />
    <Routes />
  </div>
)