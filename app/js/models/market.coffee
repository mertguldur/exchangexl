class window.Market
  constructor: ->
    this.createStocks()
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
      @cash.add(stock.sharePrice)
    stock

  buyStock: (id) ->
    stock = @stocks[id]
    sharePrice = stock.sharePrice
    if @cash.equalTo(sharePrice) || @cash.greaterThan(sharePrice)
      stock.buy()
      @cash.subtract(sharePrice)
    stock

  investments: ->
    sum = new Money(0)
    for id, stock of @stocks
      sum.add(stock.totalPrice())
    sum

  simulate: ->
    for id, stock of @stocks
      stock.simulate()
    @day += 1
