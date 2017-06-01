import React, { Component } from 'react'

import IconButton from '../template/iconButton'
import { BootstrapTable, TableHeaderColumn } from 'react-bootstrap-table'

const isCastratedStatus = {
  true: 'Sim',
  false: 'Não'
}

function enumFormatter(cell, row, enumObject) {
  return enumObject[cell] 
}

function dateFormatter(cell, row) {
  let date = new Date(cell)
  return `${('0' + date.getDate()).slice(-2)}/${('0' + (date.getMonth() + 1)).slice(-2)}/${date.getFullYear()}`;
} 

export default class PetList extends Component {

  constructor(props) {
    super(props)

    this.handlerClickCleanFiltered = this.handlerClickCleanFiltered.bind(this)
  }

  handlerClickCleanFiltered() {
    this.refs.breed.cleanFiltered()
    this.refs.name.cleanFiltered()
    this.refs.castrated.cleanFiltered()
    this.refs.owner.cleanFiltered()
  }

  render() {
    return (

      <BootstrapTable data={ this.props.list } pagination={ true } hover={ true } 
        search multiColumnSearch searchPlaceholder='Procurar...' responsive
      > 
        <TableHeaderColumn dataField='id' isKey hidden={true} >
          Id
        </TableHeaderColumn>
        <TableHeaderColumn dataField='breed' dataAlign='center' dataSort={ true } ref='breed'
          filter={ { type: 'TextFilter', placeholder: 'Digite a raça...' } } >
          Raça
        </TableHeaderColumn>
        <TableHeaderColumn dataField='name' dataAlign='center' dataSort={ true } ref='name'
          filter={ { type: 'TextFilter', placeholder: 'Digite o nome do cão...' } }
        >
          Nome
        </TableHeaderColumn>
        <TableHeaderColumn dataField='castrated' dataAlign='center' dataFormat={ enumFormatter } ref='castrated'
          formatExtraData={ isCastratedStatus } 
          filter={ { type: 'SelectFilter', options: isCastratedStatus, placeholder: 'Escolha...' } } 
        >
          Castrado
        </TableHeaderColumn>
        <TableHeaderColumn dataField='birthday' dataAlign='center' 
          dataSort={ true } dataFormat={ dateFormatter } 
        >
          Nascimento
        </TableHeaderColumn>
        <TableHeaderColumn dataField='last_consultation' dataAlign='center' 
          dataSort={ true } dataFormat={ dateFormatter } 
        >
          Última Consulta
        </TableHeaderColumn>
        <TableHeaderColumn dataField='owner' dataAlign='center' dataSort={ true } ref='owner'
          filter={ { type: 'TextFilter', placeholder: 'Digite o nome do dono...' } }
        >
          Dono
        </TableHeaderColumn>
        <TableHeaderColumn dataField='phone' dataAlign='center' dataSort={ true } >
          Telefone
        </TableHeaderColumn>
      </BootstrapTable>
    )
  }
}