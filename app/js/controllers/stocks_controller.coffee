class window.StocksController
  constructor: ->
    @view = new StocksView
    @market = new Market
    @view.render(@market.stocks, @market.investments, @market.cash)
    this.registerRoutes()

  registerRoutes: ->
    this.sell()
    this.buy()

  sell: ->
    self = this
    $('.sell-button').click ->
      id = self.buttonStockId($(this))
      market = self.market
      stock = market.sellStock(id)
      self.view.updateStock(stock)
      self.view.updateInvestments(market.investments)
      self.view.updateCash(market.cash)

  buy: ->
    self = this
    $('.buy-button').click ->
      id = self.buttonStockId($(this))
      market = self.market
      stock = market.buyStock(id)
      self.view.updateStock(stock)
      self.view.updateInvestments(market.investments)
      self.view.updateCash(market.cash)

  buttonStockId: (button) ->
    button.parent().parent().attr('id').replace('stock-', '')
