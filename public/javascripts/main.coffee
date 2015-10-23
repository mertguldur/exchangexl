$(document).ready ->
  new StocksController

class Router
  constructor: ->

class StocksController
  constructor: ->
    this.create_stocks()
    this.draw_stocks()

  create_stocks: ->
    company_names = this.company_names()
    @stocks = []
    for company_name of company_names
      @stocks << new Stock(company_name)

  draw_stocks: ->

  company_names: ->
    [
      'Franecki-Marquardt',
      'Stoltenberg'
    ]

  sell: ->

  buy: ->

class Stock
  constructor: (@company_name) ->
    @shares = 0
    @share_value = 0.00

  total_value: ->
    @shares * @share_value

class StocksView
