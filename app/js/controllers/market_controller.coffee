class window.MarketController
  constructor: ->
    @view = new MarketView
    @market = new Market
    @view.render(@market)
    this.registerRoutes()

  registerRoutes: ->
    this.sellStock()
    this.buyStock()
    this.advance()

  sellStock: ->
    self = this
    $('.sell-button').click ->
      stockId = self.buttonStockId($(this))
      self.market.sellStock(stockId)
      self.view.update(self.market)

  buyStock: ->
    self = this
    $('.buy-button').click ->
      stockId = self.buttonStockId($(this))
      self.market.buyStock(stockId)
      self.view.update(self.market)

  advance: ->
    self = this
    $('#advance-button').click ->
      self.market.simulate()
      self.view.update(self.market)

  buttonStockId: (button) ->
    button.parent().parent().attr('id').replace('stock-', '')
