class window.Money
  constructor: (dollars) ->
    @pennies = this.toPennies(dollars)

  print: ->
    "$#{this.value().toFixed(2)}"

  clone: ->
    new Money(this.value())

  value: ->
    this.toDollars(@pennies)

  multiply: (value) ->
    @pennies *= value

  toPennies: (dollars) ->
    dollars * 100.0

  toDollars: (pennies) ->
    pennies / 100.0
