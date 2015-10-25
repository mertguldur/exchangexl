class window.StocksController
  constructor: ->
    @view = new StocksView
    @market = new Market
    @view.render(@market)
    this.registerRoutes()

  registerRoutes: ->
    this.sell()
    this.buy()
    this.advance()

  sell: ->
    self = this
    $('.sell-button').click ->
      id = self.buttonStockId($(this))
      self.market.sellStock(id)
      self.view.update(self.market)

  buy: ->
    self = this
    $('.buy-button').click ->
      id = self.buttonStockId($(this))
      self.market.buyStock(id)
      self.view.update(self.market)

  advance: ->
    self = this
    $('#advance-button').click ->
      self.market.simulate()
      self.view.update(self.market)

  buttonStockId: (button) ->
    button.parent().parent().attr('id').replace('stock-', '')
