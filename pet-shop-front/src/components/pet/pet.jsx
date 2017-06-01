import React, { Component } from 'react'
import axios from 'axios'

import PageHeader from '../template/pageHeader'
import PetList from './petList'

const URL = 'http://localhost:3000/pets'

export default class Pet extends Component {
  constructor(props) {
    super(props)
    this.state = { list: [] }

    this.refresh()
  }

  refresh() {
    axios.get(`${URL}`)
      .then(resp => this.setState({ ...this.state, list: resp.data })) 
  }

  render() {
    return (
      <div>
        <PageHeader name='Animais' small='Registro'></PageHeader>

        <PetList list={this.state.list} />
      </div>
    )
  }
}