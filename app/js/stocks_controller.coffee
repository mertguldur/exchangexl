class window.StocksController
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
