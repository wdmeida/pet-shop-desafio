# Desafio para a Oportunidade Rails Developer - Ionatec

## O Problema

Temos uma Pet Shop especializada em cachorros e queremos uma listagem simples, mas
com filtro básicos, dos animais (cachorros) que já passaram pela Pet Shop.
Cada animal tem uma raça (você pode obter a listagem de raças em [http://www.portalfilhotes.com.br/racas-de-a-z/​](http://www.portalfilhotes.com.br/racas-de-a-z/​)
, gênero (macho/fêmea), castrado (sim/não), data de nascimento, nome, nome do dono, telefone do dono e data da última vez que passou pela Pet Shop.

Fique a vontade de colocar os filtros que você considerar necessários.

Para testar o software você precisa desenvolver também um gerador de 1.000 cachorros
aleatórios para a Pet Shop.

## Solução

Para a soluçaõ, foram desenvolvidos uma API e um projeto Frontend para consumir os dados. 

### Tecnologias utilizadas na API:
* [Ruby on Rails 5](http://rubyonrails.org/)
* [Ransack](https://github.com/activerecord-hackery/ransack)
* [RSpec](http://rspec.info/)

### Tecnologias utilizadas no Frontend:
* [React](https://facebook.github.io/react/)
* [Webpack](https://webpack.github.io/)
* [React Bootstrap Table](https://github.com/AllenFang/react-bootstrap-table)
* [Bootstrap](http://getbootstrap.com/)

### Pré-requisitos

Para executar os projetos são necessários os seguintes requisitos:
- Ruby 2.3.3 - [Instalação](https://gorails.com/setup/ubuntu/14.04#ruby)
- Rails 5.0.3 - [Instalação](https://gorails.com/setup/ubuntu/14.04#rails)
- Node.js - [Instalação](https://nodejs.org/en/download/package-manager/)
- NPM - [Instalação](https://docs.npmjs.com/getting-started/installing-node)

### Executando a API

1. Pelo terminal, entre no diretório 'pet_shop_api'
2. Instale as depêndencias necessárias:

  ```$ bundle install```
3. Crie a base de dados e definas as configurações iniciais do projeto executando as seguites tasks:

  ```$ rake dev:setup dev:initial_settings```
4. Inicie a aplicação, lembrando de deixar o terminal aberto para que a API fique em execução:

  ```$ rails server```

#### Executando os testes

Caso queira executar os testes da API, basta, no diretório raiz da mesma ('pet_shop_api'), executar o seguinte comando:

```bundle exec rspec -fd```

### Executando o Frontend React

1. Pelo terminal, entre no diretório 'pet-shop-front'
2. Instale as depêndencias necessárias:

  ```$ npm install```
3. Inicie a aplicação, lembrando de deixar o terminal aberto para que a API fique em execução:

  ```$ npm run dev```

## Considerações adicionais

* Os filtros de pesquisa na API foram definidos utilizando a gem Ransack, porém não foram utilizado no App Frontend porque a filtragem foi feita diretamente no mesmo, o que também foi aplicado na páginação das informações retornadas pela API.
