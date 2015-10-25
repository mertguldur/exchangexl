$(document).ready ->
  new StocksController

class StocksController
  constructor: ->
    @view = new StocksView
    @market = new Market
    @view.render(@market.stocks)
    this.registerRoutes()

  registerRoutes: ->
    this.sell()
    this.buy()

  sell: ->
    self = this
    $('.sell-button').click ->
      id = self.buttonStockId($(this))
      stock = self.market.sellStock(id)
      self.view.update(stock)

  buy: ->
    self = this
    $('.buy-button').click ->
      id = self.buttonStockId($(this))
      stock = self.market.buyStock(id)
      self.view.update(stock)

  buttonStockId: (button) ->
    button.parent().parent().attr('id').replace('stock-', '')

class Market
  constructor: ->
    this.createStocks()

  createStocks: ->
    companyNames = this.companyNames()
    @stocks = {}
    for companyName in companyNames
      id = Object.keys(@stocks).length + 1
      @stocks[id] = new Stock(id, companyName)

  sellStock: (id) ->
    stock = @stocks[id]
    stock.sell()
    stock

  buyStock: (id) ->
    stock = @stocks[id]
    stock.buy()
    stock

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
    @shares -= 1 if @shares > 0

  buy: ->
    @shares += 1

class StocksView
  render: (stocks) ->
    for id, stock of stocks
      $('#stocks').append(
        $('<tr>', id: "stock-#{id}").append(
          [
            $('<td>').text(stock.companyName),
            $('<td>', class: 'total-price').text("$#{stock.totalPrice().toPrecision(3)}"),
            $('<td>', class: 'share-price').text("$#{stock.sharePrice.toPrecision(3)}"),
            $('<td>', class: 'shares').text(stock.shares),
            $('<td>').append($('<button>', class: 'sell-button btn btn-info').text('-'))
            $('<td>').append($('<button>', class: 'buy-button btn btn-success').text('+'))
          ]
        )
      )

  update: (stock) ->
    $("#stock-#{stock.id} .total-price").text(stock.totalPrice())
    $("#stock-#{stock.id} .share-price").text(stock.sharePrice)
    $("#stock-#{stock.id} .shares").text(stock.shares)
