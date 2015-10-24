$(document).ready ->
  new StocksController

class StocksController
  constructor: ->
    @view = new StocksView
    @stocks = (new CreateStocks).call()
    @view.render(@stocks)

class CreateStocks
  call: ->
    companyNames = this.companyNames()
    stocks = []
    for companyName in companyNames
      stocks.push(new Stock(companyName))
    stocks

  companyNames: ->
    [
      'Emmerich Group',
      'Walker-Connelly',
      'Smitham Inc',
      'Oberbrunner LLC',
      'Stoltenberg',
      'Kling-Deckow',
      'Auer-Hodkiewicz',
      'Franecki-Marquardt'
    ]

class Stock
  constructor: (@companyName) ->
    @shares = 0
    @sharePrice = 0

  totalPrice: ->
    @shares * @sharePrice

class StocksView
  render: (stocks) ->
    sellButton = $('<td>').append($('<button>', class: 'btn btn-info').text('-'))
    buyButton = $('<td>').append($('<button>', class: 'btn btn-success').text('+'))
    for stock in stocks
      $('#stocks').append(
        $('<tr>').append(
          [
            $('<td>').text(stock.companyName),
            $('<td>').text("$#{stock.totalPrice().toPrecision(3)}"),
            $('<td>').text("$#{stock.sharePrice.toPrecision(3)}"),
            $('<td>').text(stock.shares),
            sellButton.clone(),
            buyButton.clone()
          ]
        )
      )
