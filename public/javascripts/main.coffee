$(document).ready ->
  new StocksController

class StocksController
  constructor: ->
    @view = new StocksView
    @stocks = this.create_stocks()
    @view.render(@stocks)

  create_stocks: ->
    company_names = this.company_names()
    stocks = []
    for company_name in company_names
      stocks.push(new Stock(company_name))
    stocks

  company_names: ->
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
  constructor: (@company_name) ->
    @shares = 0
    @share_price = 0

  total_price: ->
    @shares * @share_price

class StocksView
  render: (stocks) ->
    sell_button = $('<td>').append($('<button>', class: 'btn btn-info').text('-'))
    buy_button = $('<td>').append($('<button>', class: 'btn btn-success').text('+'))
    for stock in stocks
      $('#stocks').append(
        $('<tr>').append(
          [
            $('<td>').text(stock.company_name),
            $('<td>').text("$#{stock.total_price().toPrecision(3)}"),
            $('<td>').text("$#{stock.share_price.toPrecision(3)}"),
            $('<td>').text(stock.shares),
            sell_button.clone(),
            buy_button.clone()
          ]
        )
      )
