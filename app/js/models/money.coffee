class window.Money
  constructor: (dollars) ->
    @pennies = this.toPennies(dollars)

  print: ->
    "$#{this.value().toFixed(2)}"

  clone: ->
    new Money(this.value())

  value: ->
    this.toDollars(@pennies)

  add: (money) ->
    @pennies += money.pennies

  subtract: (money) ->
    @pennies -= money.pennies

  multiplyAmount: (amount) ->
    @pennies *= amount

  equalTo: (money) ->
    @pennies == money.pennies

  greaterThan: (money) ->
    @pennies > money.pennies

  toPennies: (dollars) ->
    dollars * 100.0

  toDollars: (pennies) ->
    pennies / 100.0
