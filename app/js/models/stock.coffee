class window.Stock
  constructor: (@id, attrs) ->
    @companyName = attrs['companyName']
    @sharePricePennies = this.toPennies(attrs['sharePrice'])
    @shares = 0

  sharePrice: ->
    this.toDollars(@sharePricePennies)

  totalPrice: ->
    this.toDollars(@shares * @sharePricePennies)

  sell: ->
    @shares -= 1 if @shares > 0

  buy: ->
    @shares += 1

  toPennies: (dollars) ->
    dollars * 100.0

  toDollars: (pennies) ->
    pennies / 100.0
