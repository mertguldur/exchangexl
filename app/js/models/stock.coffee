class window.Stock
  constructor: (@id, attrs) ->
    @companyName = attrs['companyName']
    @sharePrice = new Money(attrs['sharePrice'])
    @shares = 0

  totalPrice: ->
    price = @sharePrice.clone()
    price.multiply(@shares)
    price

  sell: ->
    @shares -= 1 if @shares > 0

  buy: ->
    @shares += 1

