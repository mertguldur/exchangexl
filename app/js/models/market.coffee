class window.Market
  constructor: ->
    this.createStocks()
    @investments = new Money(0)
    @cash = new Money(5000)
    @day = 1

  createStocks: ->
    stockData = (new StockData).data
    @stocks = {}
    for stockAttrs in stockData
      id = Object.keys(@stocks).length + 1
      @stocks[id] = new Stock(id, stockAttrs)

  sellStock: (id) ->
    stock = @stocks[id]
    if stock.shares > 0
      stock.sell()
      @investments.subtract(stock.sharePrice)
      @cash.add(stock.sharePrice)
    stock

  buyStock: (id) ->
    stock = @stocks[id]
    sharePrice = stock.sharePrice
    if @cash.equalTo(sharePrice) || @cash.greaterThan(sharePrice)
      stock.buy()
      @investments.add(sharePrice)
      @cash.subtract(sharePrice)
    stock

  simulate: ->
    @day += 1
