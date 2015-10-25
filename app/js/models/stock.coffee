class window.Stock
  constructor: (@id, attrs) ->
    @companyName = attrs['companyName']
    @sharePrice = attrs['sharePrice']
    @shares = 0

  totalPrice: ->
    @shares * @sharePrice

  sell: ->
    @shares -= 1 if @shares > 0

  buy: ->
    @shares += 1
