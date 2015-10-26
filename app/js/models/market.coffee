class window.Market
  constructor: ->
    this.createStocks()
    @cash = new Money(5000)
    @day = 1

  createStocks: ->
    stockData = (new StockData).data
    @stocks = {}
    for stockAttrs in stockData
      stockId = Object.keys(@stocks).length + 1
      @stocks[stockId] = new Stock(stockId, stockAttrs)

  sellStock: (stockId) ->
    stock = @stocks[stockId]
    if stock.shares > 0
      stock.sell()
      @cash.add(stock.sharePrice)
    stock

  buyStock: (stockId) ->
    stock = @stocks[stockId]
    sharePrice = stock.sharePrice
    if @cash.equalTo(sharePrice) || @cash.greaterThan(sharePrice)
      stock.buy()
      @cash.subtract(sharePrice)
    stock

  investments: ->
    sum = new Money(0)
    for stockId, stock of @stocks
      sum.add(stock.totalPrice())
    sum

  simulate: ->
    for stockId, stock of @stocks
      stock.simulate()
    @day += 1
