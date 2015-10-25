class window.Market
  constructor: ->
    this.createStocks()
    @investments = new Money(0)
    @cash = new Money(5000)

  createStocks: ->
    stockData = (new StockData).data
    @stocks = {}
    for stockAttrs in stockData
      id = Object.keys(@stocks).length + 1
      @stocks[id] = new Stock(id, stockAttrs)

  sellStock: (id) ->
    stock = @stocks[id]
    stock.sell()
    stock

  buyStock: (id) ->
    stock = @stocks[id]
    stock.buy()
    stock
