class window.Stock
  constructor: (@id, attrs) ->
    @companyName = attrs['companyName']
    @sharePrice = new Money(attrs['sharePrice'])
    @shares = 0

  totalPrice: ->
    price = @sharePrice.clone()
    price.multiplyAmount(@shares)
    price

  sell: ->
    @shares -= 1

  buy: ->
    @shares += 1

  simulate: ->
    priceChangeRate = Math.random() / 10
    priceChangeRate *= -1 if Math.random() < 0.5
    priceChange = @sharePrice.clone()
    priceChange.multiplyAmount(priceChangeRate)
    @sharePrice.add(priceChange)
