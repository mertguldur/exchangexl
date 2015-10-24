$(document).ready ->
  new StocksController

class StocksController
  constructor: ->
    @view = new StocksView
    @stocks = (new CreateStocks).call()
    @view.render(@stocks)
    this.registerRoutes()

  registerRoutes: ->
    this.sell()
    this.buy()

  sell: ->
    $('.sell-button').click =>
      id = $(this).attr('stock_id')
      @stocks[id].sell()

  buy: ->
    $('.buy-button').click ->
      id = $(this).attr('stock_id')
      @stocks[id].buy()

class CreateStocks
  call: ->
    companyNames = this.companyNames()
    stocks = {}
    for companyName in companyNames
      id = Object.keys(stocks).length + 1
      stocks[id] = new Stock(id, companyName)
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
  constructor: (@id, @companyName) ->
    @shares = 0
    @sharePrice = 0

  totalPrice: ->
    @shares * @sharePrice

  sell: ->
    return if @shares == 0
    @shares -= 1

  buy: ->
    @shares += 1

class StocksView
  render: (stocks) ->
    for id, stock of stocks
      $('#stocks').append(
        $('<tr>', id: "stock_#{id}").append(
          [
            $('<td>').text(stock.companyName),
            $('<td>', class: 'total-price').text("$#{stock.totalPrice().toPrecision(3)}"),
            $('<td>', class: 'share-price').text("$#{stock.sharePrice.toPrecision(3)}"),
            $('<td>', class: 'shares').text(stock.shares),
            $('<td>').append($('<button>', stock_id: id, class: 'sell-button btn btn-info').text('-'))
            $('<td>').append($('<button>', stock_id: id, class: 'buy-button btn btn-success').text('+'))
          ]
        )
      )

  update: (stock) ->
    $("#stock-#{stock.id} .total-price").text(stock.total_price())
    $("#stock-#{stock.id} .share-price").text(stock.share_price)
    $("#stock-#{stock.id} .shares").text(stock.shares)
